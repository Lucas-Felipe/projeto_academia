# Query para inserir usuario
insert_usuario = """INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)"""
# Query para inserir aluno
insert_aluno = """INSERT INTO ALUNOS (altura, peso, n_cartao, link_call, objetivo, cpf_aluno, cpf_instrutor) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
# Query para inserir instrutor
insert_instrutor = """INSERT INTO INSTRUTORES (salario, especializacao, conta, cpf_instrutor) VALUES (%s, %s, %s, %s)"""
# Query para inserir frequencia
insert_frequencia = """INSERT INTO FREQUENCIAS (hora_entrada, hora_saida, data, u_cpf) VALUES (%s, %s, %s, %s)"""

# Lista todos os exercícios
select_todos_exerciicos = "SELECT E.nome, E.musculo FROM academia.EXERCICIOS AS E;"

# Insere novo exercícios
insert_novo_exercicio = """INSERT INTO EXERCICIOS (nome, musculo)
VALUES (%s, %s);"""

# Query para listar os alunos e seus respectivos instrutores
select_alunos_com_instrutor = """SELECT  U2.nome as nome_aluno, A.cpf_aluno,A.altura ,A.peso ,A.objetivo, I.cpf_instrutor,
U.nome as nome_instrutor from academia.ALUNOS as A 
left join academia.USUARIOS as U2 on U2.cpf =A.cpf_aluno 
left join academia.INSTRUTORES as I using (cpf_instrutor)
left join academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
ORDER BY U.nome;"""

# Retorna lista com todos os instrutores
select_todos_instrutores = """SELECT U.nome, I.especializacao, U.dt_inicio, U.email 
    FROM INSTRUTORES AS I, USUARIOS AS U
    WHERE cpf = cpf_instrutor;"""

# Query para listar os instrutores e quantos alunos cada um tem
select_instrutores_e_cont_alunos = """SELECT U.nome, I.especializacao, COUNT(A.cpf_aluno) as contagem_de_alunos from academia.INSTRUTORES as I
left join academia.ALUNOS as A on A.cpf_instrutor =I.cpf_instrutor 
LEFT JOIN academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
GROUP by I.cpf_instrutor;"""

# Query para listar todas as frequencias (log de frequencias)
select_todas_frequencias = """SELECT * from academia.FREQUENCIAS as F
left join academia.USUARIOS as U on U.cpf =F.u_cpf 
ORDER by U.nome;"""

# Query que lista todos os usuários
select_todos_usuarios = """SELECT cpf, nome, dt_inicio, email, adm from academia.USUARIOS ORDER by USUARIOS.nome;"""

# Query que mostra todas as fichas de um aluno
select_fichas_de_aluno = """SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf=%s AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;"""

# Retorna a ficha de treino em um dia especificado
select_ficha_dia_semana = """SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf=%s AND T.dia_semana=%s AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;"""

# Retorna as fichas de treino de um usuario em um periodo especificado
select_fichas_periodo = """SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf=%s AND T.dia_semana>=%s AND T.dia_semana <=%s AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio ORDER by T.dia_semana;"""

# Retorna dados de todos os salários (Total pago, maior e menor salário, média salarial e número de funcionários)
select_salarios = """SELECT SUM(salario), MAX(salario), MIN(salario), AVG(salario), COUNT(*)
    FROM INSTRUTORES;
"""

# Retorna os instrutores que possuem numero de alunos igual ou maior que o informado
select_instrutores_n_alunos = """SELECT U.nome
FROM USUARIOS AS U, INSTRUTORES AS I 
WHERE U.cpf = cpf_instrutor 
AND 
(SELECT COUNT(*) FROM ALUNOS AS A WHERE A.cpf_instrutor = I.cpf_instrutor) >= %s;"""

select_inadimplentes_mes = """SELECT U.nome, U.cpf 
FROM USUARIOS AS U, ALUNOS AS A 
WHERE U.cpf = A.cpf_aluno AND NOT EXISTS (SELECT *
                                      FROM PAGAMENTOS
                                      WHERE U.cpf = cpf_cliente AND dt_pagamento LIKE  %s);"""
