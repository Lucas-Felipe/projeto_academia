from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

from helper_functions.queries_functions import run_insert_query
from helper_functions.queries import insert_usuario, insert_aluno, insert_instrutor, insert_frequencia

app = Flask(__name__)


@app.route('/')
def home():
    return "Hello world"


@app.route('/add_usuario', methods=['POST'])
def add_usuario():
    request_data = request.get_json()
    print(request_data)
    insert_query = insert_usuario
    val = (request_data['cpf'], request_data['nome'], request_data['dt_inicio'],
           request_data['email'], request_data['senha'], request_data['adm'])
    res = []
    res.append(run_insert_query(insert_query, val, "USUARIOS"))
    return json.dumps(res)


@app.route('/add_aluno', methods=['POST'])
def add_aluno():
    request_data = request.get_json()
    insert_query_usuario = insert_usuario
    val_usuario = (request_data['cpf'], request_data['nome'], request_data['dt_inicio'],
                   request_data['email'], request_data['senha'], request_data['adm'])
    insert_query_aluno = insert_aluno
    val_aluno = (request_data['altura'], request_data['peso'], request_data['n_cartao'],
                 request_data['link_call'], request_data['objetivo'], request_data['cpf'], request_data['cpf_instrutor'])
    res = []
    res.append(run_insert_query(insert_query_usuario, val_usuario, 'USUARIOS'))
    res.append(run_insert_query(insert_query_aluno, val_aluno, "ALUNOS"))
    return json.dumps(res)


@app.route("/add_instrutor", methods=['POST'])
def add_instrutor():
    request_data = request.get_json()
    insert_query_usuario = """INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)"""
    val_usuario = (request_data['cpf'], request_data['nome'], request_data['dt_inicio'],
                   request_data['email'], request_data['senha'], request_data['adm'])
    insert_query_instrutor = insert_instrutor
    val_instrutor = (request_data['salario'], request_data['especializacao'],
                     request_data['conta'], request_data['cpf'])
    res = []
    res.append(run_insert_query(insert_query_usuario, val_usuario, 'USUARIOS'))
    res.append(run_insert_query(
        insert_query_instrutor, val_instrutor, "INSTRUTORES"))
    return json.dumps(res)


@app.route('/add_frequencia', methods=['POST'])
def add_frequencia():
    request_data = request.get_json()
    insert_query = insert_frequencia
    val = (request_data['hora_entrada'], request_data['hora_saida'],
           request_data['Data'], request_data['u_cpf'])
    res = []
    res.append(run_insert_query(insert_query, val, "FREQUENCIAS"))
    return json.dumps(res)


if __name__ == "__main__":
    app.run(host='0.0.0.0')
