from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

from helper_functions.queries_functions import run_insert_query

app = Flask(__name__)

DB_HOST = 'mariadb'  # environ.get('DB_HOST')
DB_NAME = 'academia'  # environ.get('DB_NAME')
DB_USER = 'acadadmin'  # environ.get('DB_USER')
DB_PASSWORD = 'acad123'  # environ.get('MARIADB_PASSWORD')


@app.route('/')
def home():
    print("Hello world")
    return run_insert_query("""INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)""", (123456, "nome", "2021-09-14", "email@email.com", "senha123", True), "USUARIOS")


@app.route('/add_usuario', methods=['POST'])
def add_usuario():
    request_data = request.get_json()
    insert_query = """INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)"""
    val = (request_data['cpf'], request_data['nome'], request_data['dt_inicio'],
           request_data['email'], request_data['senha'], request_data['adm'])
    res = []
    res.append(run_insert_query(insert_query, val, "USUARIOS"))
    print(request_data['cpf'])
    return json.dumps(res)


""" def run_insert_query(query, values, table_name):
    connection = get_database_connection()
    res = ''
    id = None
    try:
        cursor = connection.cursor()
        cursor.execute(query, values)
        connection.commit()
        id = cursor.lastrowid
        if id is not None:
            res += 'Record with id('+str(id) + \
                ') inserted successfully into '+table_name+' table'
        else:
            res += str(cursor.rowcount) + \
                ' Record inserted successfully into '+table_name+' table'
        print(res)
        cursor.close()
    except mysql.connector.Error as error:
        res += "Failed to inser record into table {}".format(error)
        print(res)
    finally:
        if connection.is_connected():
            connection.close()
    return (res, id) """


""" def get_database_connection():
    return mysql.connector.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASSWORD) """


if __name__ == "__main__":
    app.run(host='0.0.0.0')
