# Query para inserir usuario
insert_usuario = """INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)"""
# Query para inserir aluno
insert_aluno = """INSERT INTO ALUNOS (altura, peso, n_cartao, link_call, objetivo, cpf_aluno, cpf_instrutor) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
# Query para inserir instrutor
insert_instrutor = """INSERT INTO INSTRUTORES (salario, especializacao, conta, cpf_instrutor) VALUES (%s, %s, %s, %s)"""
# Query para inserir frequencia
insert_frequencia = """INSERT INTO FREQUENCIAS (hora_entrada, hora_saida, data, u_cpf) VALUES (%s, %s, %s, %s)"""

# Query para listar os alunos e seus respectivos instrutores
select_alunos_com_instrutor = """SELECT  U2.nome as nome_aluno, A.cpf_aluno,A.altura ,A.peso ,A.objetivo, I.cpf_instrutor,
U.nome as nome_instrutor from academia.ALUNOS as A 
left join academia.USUARIOS as U2 on U2.cpf =A.cpf_aluno 
left join academia.INSTRUTORES as I using (cpf_instrutor)
left join academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
ORDER BY U.nome;"""
