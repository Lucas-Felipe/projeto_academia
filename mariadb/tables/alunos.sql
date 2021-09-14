START TRANSACTION;
CREATE TABLE IF NOT EXISTS ALUNOS(
    altura FLOAT,
    peso FLOAT,
    n_cartao VARCHAR(16),
    link_call VARCHAR(30),
    objetivo VARCHAR(300) NOT NULL,
    cpf_aluno VARCHAR(11),
    cpf_instrutor VARCHAR(11),
    FOREIGN KEY (cpf_aluno) REFERENCES USUARIOS(cpf),
    FOREIGN KEY (cpf_instrutor) REFERENCES INSTRUTORES(cpf_instrutor),
    PRIMARY KEY(cpf_aluno)
);
COMMIT;