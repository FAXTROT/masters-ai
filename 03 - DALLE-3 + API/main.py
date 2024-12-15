from openai import OpenAI
from dotenv import load_dotenv
from os import getenv

load_dotenv()

OPEN_AI_API_KEY = getenv("OPENAI_API_KEY")

client = OpenAI()

response = client.images.generate(
    model="dall-e-3",
    prompt="Chilling Capybara",
    size="1024x1024",
    quality="standard",
    n=1,
)

image_url = response.data[0].url
print(image_url)
