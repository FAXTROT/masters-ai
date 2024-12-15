from openai import OpenAI
from dotenv import load_dotenv
from os import getenv

with open('lesson_1_transcipt.txt', 'r') as source:
    context = source.read()

load_dotenv()

OPEN_AI_API_KEY = getenv("OPENAI_API_KEY")

client = OpenAI()

completion = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are helpful assistant"},
        {
            "role": "user",
            "content": "Write a blogpost about the lecture. Here is the lecture transcript: " + context
        }
    ]
)

result = completion.choices[0].message.content

with open('README.md', 'w') as destination:
    destination.write(result)

print('DONE !')
