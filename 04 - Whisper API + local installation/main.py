import whisper
import re

model = whisper.load_model("base", device="cuda")
result = model.transcribe("ITPU_MS_Degree_Session_5_Meeting_Recording.mp3")
transcript = '\n'.join(re.findall('.*?[.!?]', result['text']))
print(transcript)

with open('transcript.txt', 'w') as f:
    f.write(transcript)
