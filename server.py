from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

app = Flask(__name__)


@app.route('/')
def home():
    return "Hello world"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
