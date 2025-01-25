import streamlit as st

# Sample data
items = [
    {
        "title": "Laptop",
        "description": "A powerful laptop with 16GB RAM and 512GB SSD.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.9sgxx3B2XW52s3eo4-Ru1gHaEr&pid=Api",
        "price": "$1200"
    },
    {
        "title": "Headphones",
        "description": "Noise-cancelling over-ear headphones.",
        "image": "https://tse3.mm.bing.net/th?id=OIP.6WZHCb9rVStvjjH43x9kXQHaHa&pid=Api",
        "price": "$200"
    },
    {
        "title": "Smartphone",
        "description": "A smartphone with an excellent camera.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.8lVUKQr3ZFZ92YtiWAiuGQHaE7&pid=Api",
        "price": "$800"
    },
    {
        "title": "Smartwatch",
        "description": "A smartwatch with health-tracking features.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.Zk8F5CI1UKocMt2ZHM2EqAHaHa&pid=Api",
        "price": "$250"
    },
    {
        "title": "Camera",
        "description": "A digital camera with 20MP resolution and 4K video recording.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.9sgxx3B2XW52s3eo4-Ru1gHaEr&pid=Api",
        "price": "$1500"
    },
    {
        "title": "Tablet",
        "description": "A tablet with a 10-inch screen and 64GB storage.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.Zk8F5CI1UKocMt2ZHM2EqAHaHa&pid=Api",
        "price": "$300"
    },
    {
        "title": "Speaker",
        "description": "A portable Bluetooth speaker with excellent sound quality.",
        "image": "https://tse3.mm.bing.net/th?id=OIP.6WZHCb9rVStvjjH43x9kXQHaHa&pid=Api",
        "price": "$100"
    },
    {
        "title": "Gaming Console",
        "description": "A next-gen gaming console with 1TB storage.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.8lVUKQr3ZFZ92YtiWAiuGQHaE7&pid=Api",
        "price": "$500"
    },
    {
        "title": "Monitor",
        "description": "A 27-inch 4K monitor with vibrant colors.",
        "image": "https://tse1.mm.bing.net/th?id=OIP.9sgxx3B2XW52s3eo4-Ru1gHaEr&pid=Api",
        "price": "$400"
    }
]

st.title("Welcome to Techs&Wrecks")

columns = st.columns(3)

for i, item in enumerate(items):
    col = columns[i % 3]
    with col:
        st.header(item["title"])
        st.image(item["image"], width=150)
        st.write(item["description"])
        st.write(f"**Price:** {item['price']}")
        st.markdown("---")

# Simple chat interface
st.sidebar.title("Support Chat")

if 'messages' not in st.session_state:
    st.session_state.messages = []

with st.sidebar:
    chat_input = st.text_input("You:", "")
    if st.button("Send"):
        st.session_state.messages.append(("user", chat_input))
        st.session_state.messages.append(("bot", "Thank you for reaching out! How can I assist you today?"))

    for user, msg in st.session_state.messages:
        if user == "user":
            st.markdown(f'<div style="background-color: #051df5; padding: 10px; border-radius: 5px;">You: {msg}</div>',
                        unsafe_allow_html=True)
        else:
            st.markdown(
                f'<div style="background-color: #069602; padding: 10px; border-radius: 5px;">Support: {msg}</div>',
                unsafe_allow_html=True)
