from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from os import environ

from helper_functions.queries_functions import run_insert_query, run_select_query
from helper_functions.queries import insert_usuario, insert_aluno, insert_instrutor, insert_frequencia, select_alunos_com_instrutor, select_instrutores_e_cont_alunos, select_todas_frequencias, select_todos_usuarios, select_fichas_de_aluno, select_ficha_dia_semana, select_fichas_periodo, select_salarios, select_instrutores_n_alunos

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False


@app.route('/')
def home():
    return "API da academia"


@app.route('/add_usuario', methods=['POST'])
def add_usuario():
    request_data = request.get_json()
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
    insert_query_usuario = insert_usuario
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


@app.route('/lista_alunos_com_instrutor', methods=['GET'])
def lista_alunos_com_instrutor():
    select_query = select_alunos_com_instrutor
    return run_select_query(select_query)


@app.route('/instrutores_e_cont_alunos', methods=['GET'])
def instrutores_e_cont_alunos():
    select_query = select_instrutores_e_cont_alunos
    return run_select_query(select_query)


@app.route('/todas_frequencias', methods=['GET'])
def todas_frequencias():
    return run_select_query(select_todas_frequencias)


@app.route("/mostrar_todos_usuarios", methods=['GET'])
def mostrar_todos_usuarios():
    return run_select_query(select_todos_usuarios)


# esse metodo usa json pra retornar
@app.route("/fichas_de_aluno", methods=['GET'])
def fichas_de_aluno():
    request_data = request.get_json()
    cpf = request_data['cpf']
    return run_select_query(select_fichas_de_aluno, cpf)


@app.route('/ficha_dia_semana', methods=['GET'])
def ficha_dia_semana():
    request_data = request.get_json()
    values = (request_data['cpf'], str(request_data['dia']))
    return run_select_query(select_ficha_dia_semana, values)


@app.route('/fichas_periodo', methods=['GET'])
def fichas_periodo():
    request_data = request.get_json()
    values = (request_data['cpf'], str(
        request_data['dia_inicio']), str(request_data['dia_fim']))
    return run_select_query(select_fichas_periodo, values)


@app.route('/salarios', methods=['GET'])
def salarios():
    return run_select_query(select_salarios)


@app.route('/instrutores_n_alunos', methods=['GET'])
def instrutores_n_alunos():
    request_data = request.get_json()
    values = tuple(str(request_data['n_alunos']))
    return run_select_query(select_instrutores_n_alunos, values)


@app.route("/teste", methods=['GET'])
def test_param():
    param = request.args.get('aa')
    # url do get tem que ser : http://.../teste?aa=PARAMETROAQUI   para solicitacao via url

    request_data = request.get_json()
    test_json = request_data['bb']
    # solicitacao com body em json tem que ser {"bb" : "valor" }

    return test_json


if __name__ == "__main__":
    app.run(host='0.0.0.0')
