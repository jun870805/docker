import os
from flask import Flask, request, abort

app = Flask(__name__)

# Flask GET/POST home 
@app.route("/api/home", methods=['GET','POST'])
def home():
    text = ""
    if request.method == 'GET':
        text = request.args.get('value')
    if request.method == 'POST':
        text = request.form.get('value')

    return "Hello "+str(text)+"~~~~~"
