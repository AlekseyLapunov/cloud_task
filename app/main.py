from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def help():
    out = "Allowed methods:\n"
    for method in ["hostname", "author", "id"]:
        out += "GET /{}\n".format(method)
    return out, 200

@app.route("/hostname")
def hostname():
    return os.popen("hostname").read(), 200

@app.route("/author")
def author():
    return os.popen("echo $AUTHOR").read(), 200

@app.route("/id")
def id():
    return os.popen("echo $UUID").read(), 200

if(__name__) == '__main__':
    app.run(host="0.0.0.0", port=8000)
