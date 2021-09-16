# Query para inserir usuario
insert_usuario = """INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) VALUES (%s, %s, %s, %s, %s, %s)"""
# Query para inserir aluno
insert_aluno = """INSERT INTO ALUNOS (altura, peso, n_cartao, link_call, objetivo, cpf_aluno, cpf_instrutor) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
# Query para inserir instrutor
insert_instrutor = """INSERT INTO INSTRUTORES (salario, especializacao, conta, cpf_instrutor) VALUES (%s, %s, %s, %s)"""
# Query para inserir frequencia
insert_frequencia = """INSERT INTO FREQUENCIAS (hora_entrada, hora_saida, data, u_cpf) VALUES (%s, %s, %s, %s)"""
