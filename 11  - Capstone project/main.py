import streamlit as st
from dotenv import load_dotenv
import openai, os
import requests as req
import json
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

# Main content (dynamic part)
placeholder = st.empty()  # Create an empty container for dynamic updates

def retrieve_data(sql):
    if not sql.upper().startswith("SELECT"):
        sql = json.loads(sql)['sql']

    logger.info("Retrieve data SQL: %s and its type : %s", sql, str(type(sql)))
    data = json.dumps({"request": sql})
    response = req.post("http://localhost:8000/api/retrieve", data=data)

    st.session_state.items_to_draw = sql
    try:
        with placeholder.container():  # Dynamic container
            st.title("Welcome to Techs&Wrecks")
            columns = st.columns(3)
            items = response.json()['data']
            logger.info("Display items : %s", str(items))
            for i, item in enumerate(items):
                col = columns[i % 3]
                with col:
                    st.header(item[1])
                    st.image(item[3], width=150)
                    st.write(item[2])
                    st.write(f"**Price:** {item[4]}")
                    st.write(f"**In stock:** {item[5]}")
                    st.markdown("---")
    except Exception as e:
        logger.error("Display items error : %s", str(e))

    return items

def put_order(item_id, quantity):
    logger.info("Order : %s) %s", str(item_id), str(quantity))
    data = json.dumps({"item_id": item_id, "quantity": quantity})
    response = req.post("http://localhost:8000/api/order", data=data)
    return response.json()

database_schema_string = """
Table: orders
Columns: id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    image_url TEXT,
    price INTEGER,
    in_stock INTEGER CHECK(in_stock >= 0)
    
Table: orders
Columns: quantity INTEGER,
    item_id INTEGER,
    FOREIGN KEY (item_id) REFERENCES stock(id)
"""

tools = [{
    "type": "function",
    "function": {
        "name": "retrieve_data",
        "description": "Use this function to answer user questions about data. "
                       "If user asks data about orders, join it with stock and retrieve all the data about items",
        "parameters": {
            "type": "object",
            "properties": {
                "sql": {"type": "string",
                        "description": f"""
                                    SQL query extracting info to answer the user's question.
                                    SQL should be written using this database schema:
                                    {database_schema_string}
                                    The query should be provided in plain text, not in JSON.
                                    Always select all columns of stock table !
                                    """,
                        }
            },
            "required": ["sql",],
            "additionalProperties": False
        },
        "strict": True
    }
},
    {
        "type": "function",
        "function": {
            "name": "put_order",
            "description": "Use this function to put order for the user",
            "parameters": {
                "type": "object",
                "properties": {
                    "item_id": {"type": "integer"},
                    "quantity": {"type": "integer"}
                },
                "required": ["item_id", "quantity"],
                "additionalProperties": False
            },
            "strict": True
        }
    }
]


load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

def generate_response(prompt, previous_context=None):
    previous_context = [previous_context[0],] + previous_context[1:][::-1]

    logger.info("Previous context: %s\n", str(previous_context))
    context_messages = []
    if previous_context is not None:
        context_messages += previous_context
    context_messages.append({"role": "user", "content": prompt})

    logger.info("Generating response for prompt: %s", prompt)
    response = openai.chat.completions.create(
        model="gpt-4o",
        messages=context_messages,
        tools = tools,
    )
    logger.info("RAW response: " + str(response))

    if response.choices[0].finish_reason == 'tool_calls':
        tool_call = response.choices[0].message.tool_calls[0]
        if tool_call.function.name == 'retrieve_data':
            out = retrieve_data(tool_call.function.arguments)
            logger.info("Output of retrieve_data function call: " + str(out))
            context_messages.append({"role": "system", "content": "You requested system call" + str(tool_call) +
                                                  "And got the next answer: " + str(out)})
            response = openai.chat.completions.create(
                model="gpt-4o",
                messages=context_messages
            )
            logger.info("RAW response after retrieve_data function call: " + str(response))
        elif tool_call.function.name == 'put_order':
            args = json.loads(tool_call.function.arguments)
            item_id, quantity = args["item_id"], args["quantity"]
            out = put_order(item_id, quantity)
            context_messages.append({"role": "system", "content": "You requested system call" + str(tool_call) +
                                                  "And got the next answer: " + str(out)})
            logger.info("Output of put_order function call: " + str(out))
            response = openai.chat.completions.create(
                model="gpt-4o",
                messages=context_messages
            )
            logger.info("RAW response after put_order function call: " + str(response))

    message = response.choices[0].message.content
    logger.info("Response generated: %s", message)
    return message

if 'items_to_draw' not in st.session_state:
    st.session_state.items_to_draw = "select * from stock"

# first draw
retrieve_data(st.session_state.items_to_draw)

logger.info("All products displayed")

# Simple chat interface
st.sidebar.title("Support Chat")

if 'messages' not in st.session_state:
    st.session_state.messages = []

if "global_context" not in st.session_state:
    st.session_state.global_context = [{"role": "system", "content": "You are a helpful assistant in Techs&Wrecks company"}, ]

with st.sidebar:
    chat_input = st.text_input("You:", "")
    if st.button("Send"):
        logger.info("USER INPUT: " + chat_input)
        st.session_state.messages.insert(0, ("user", chat_input))
        # Call OpenAI API
        with st.spinner("Generating response..."):
            try:
                res = generate_response(chat_input, st.session_state.global_context)
                st.session_state.messages.insert(0, ("bot", res))
            except Exception as e:
                logger.error("Error generating answer: %s", str(e))
                st.error(f"Error: {e}")


    st.session_state.global_context = [{"role": "system", "content": "You are a helpful assistant in Techs&Wrecks company"}, ]
    for user, msg in st.session_state.messages:
        if user == "user":
            st.session_state.global_context.append({"role": "user", "content": msg})
            st.markdown(f'<div style="background-color: #051df5; padding: 10px; border-radius: 5px;">You: {msg}</div>',
                        unsafe_allow_html=True)
        else:
            st.session_state.global_context.append({"role": "system", "content": msg})
            st.markdown(
                f'<div style="background-color: #069602; padding: 10px; border-radius: 5px;">Support: {msg}</div>',
                unsafe_allow_html=True)
