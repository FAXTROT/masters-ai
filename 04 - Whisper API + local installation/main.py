import whisper
import re

model = whisper.load_model("base", device="cuda")
result = model.transcribe("Adam_Lambert__Whataya_Want_from_Me.mp3")
transcript = '\n'.join(re.split('[?,.A-Z] ', result['text']))
print(transcript)

with open('transcript.txt', 'w') as f:
    f.write(transcript)
