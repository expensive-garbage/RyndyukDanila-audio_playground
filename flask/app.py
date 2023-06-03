import flask
import os
import speech_recognition as sr

import utils


app = flask.Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    json_file = {}
    json_file['main'] = 'test'
    return flask.jsonify(json_file)


@app.route("/STT", methods=["POST"])
def predictSTT():
    try:
        filename = './stt.wav'
        language = flask.request.form.get('speech-language')
        print(language)
        audio_file = flask.request.files["file"]
        audio_file.save(filename)

        with sr.AudioFile(filename) as source:
            r = sr.Recognizer()
            audio = r.record(source)
            text = r.recognize_google(audio,
                                      language=language
                                      )
            print(f'You said: {text}')

        os.remove(filename)

        json_file = {}
        json_file['STTtext'] = text
        return flask.jsonify(json_file)
    
    except:
        raise


@app.route("/TTS", methods=["POST"])
def predictTTS():
    try:
        filename = './tts.wav'

        from gtts import gTTS

        slow = flask.request.form.get('tts-slow')
        lang = flask.request.form.get('text-language')
        text = flask.request.form.get('text')


        tts = gTTS(
                slow=slow,
                lang=lang, 
                text=text,
                )

        tts.save(filename)

        return flask.jsonify('good!')
    
    except:
        raise


if __name__ == '__main__':
    app.run(debug=True,)
