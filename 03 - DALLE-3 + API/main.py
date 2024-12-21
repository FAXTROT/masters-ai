from openai import OpenAI
from dotenv import load_dotenv
from os import getenv
import requests

load_dotenv()

OPEN_AI_API_KEY = getenv("OPENAI_API_KEY")

client = OpenAI()

user_prompt = input('Input : ')

styles = ['Black and white', 'Chilling', 'Realistic', 'Cartoon', 'Giantism', 'Monumental', 'Surrealistic',
          'Cyberpunk', 'Biopunk']

for style in styles:
    response = client.images.generate(
        model="dall-e-3",
        prompt=user_prompt + '. In ' + style + ' style',
        size="1024x1024",
        quality="standard",
        n=1,
    )

    image_url = response.data[0].url
    print(user_prompt + '__in_' + style + ' style. URL: ' + image_url)
    try:
        img_data = requests.get(image_url).content
        with open(user_prompt + '__in_' + style + '_style' + '.png', 'wb') as handler:
            handler.write(img_data)
    except Exception as err:
        print('Could not download the image: ' + image_url)
        print(err)
