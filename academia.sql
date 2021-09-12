
-- criação do database

CREATE DATABASE ACADEMIA;
USE ACADEMIA;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS USUARIOS(
	cpf INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dt_inicio DATE ,
    email VARCHAR(50) NOT NULL,
	senha VARCHAR(100) NOT NULL,
    adm BOOLEAN
);

CREATE TABLE IF NOT EXISTS INSTRUTORES(
	salário FLOAT,
    especializacao VARCHAR(20),
    conta VARCHAR(30),
    cpf_instrutor INT, 
    FOREIGN KEY (cpf_instrutor) REFERENCES USUARIOS(cpf),
    PRIMARY KEY(cpf_instrutor)
);

CREATE TABLE IF NOT EXISTS ALUNOS(
	altura FLOAT,
    peso FLOAT,
    n_cartao VARCHAR(16),
    link_call VARCHAR(30),
    objetivo VARCHAR(300) NOT NULL,
    cpf_aluno INT,
    cpf_instrutor INT, 
    FOREIGN KEY (cpf_aluno) REFERENCES USUARIOS(cpf),
    FOREIGN KEY (cpf_instrutor) REFERENCES INSTRUTORES(cpf_instrutor),
    PRIMARY KEY(cpf_aluno)
);

CREATE TABLE IF NOT EXISTS FREQUENCIAS(
    hora_entrada TIME NOT NULL,
    hora_saida TIME NOT NULL,
    data_ DATE NOT NULL,
    u_cpf INT,
    FOREIGN KEY (u_cpf) REFERENCES USUARIOS(cpf),
    PRIMARY KEY(data_, u_cpf)
);

CREATE TABLE IF NOT EXISTS PAGAMENTOS(
    id_pagamento INT PRIMARY KEY,
    dt_pagamento DATE NOT NULL,
    forma VARCHAR(10) NOT NULL,
    valor FLOAT NOT NULL,
    cpf_cliente INT,
    FOREIGN KEY (cpf_cliente) REFERENCES ALUNOS(cpf_aluno)
);

CREATE TABLE IF NOT EXISTS FICHAS(
    id_ficha INT,
    n_repeticoes TINYINT,
    n_series TINYINT NOT NULL,
    peso FLOAT NOT NULL,
    a_cpf INT,
    FOREIGN KEY (a_cpf) REFERENCES ALUNOS(cpf_aluno),
    PRIMARY KEY(id_ficha, a_cpf)
);

CREATE TABLE IF NOT EXISTS TREINOS(
    dia_semana DATE NOT NULL,
    id_ficha INT,
    u_cpf INT,
    i_cpf INT,
    FOREIGN KEY (id_ficha) REFERENCES FICHAS(id_ficha),
    FOREIGN KEY (u_cpf) REFERENCES ALUNOS(cpf_aluno),
    FOREIGN KEY (i_cpf) REFERENCES INSTRUTORES(cpf_instrutor),
    PRIMARY KEY(id_ficha, u_cpf)
);

CREATE TABLE IF NOT EXISTS EXERCICIO(
    id_exercicio INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    musculo VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS CONTEM(
    id_exercicio INT,
    id_ficha INT,
    FOREIGN KEY (id_exercicio) REFERENCES EXERCICIO(id_exercicio),
    FOREIGN KEY (id_ficha) REFERENCES FICHAS(id_ficha),
    PRIMARY KEY(id_ficha, id_exercicio)
);
