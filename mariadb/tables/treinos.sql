START TRANSACTION;
CREATE TABLE IF NOT EXISTS TREINOS(
    dia_semana DATE NOT NULL,
    id_ficha INT,
    u_cpf VARCHAR(11),
    i_cpf VARCHAR(11),
    FOREIGN KEY (id_ficha) REFERENCES FICHAS(id_ficha),
    FOREIGN KEY (u_cpf) REFERENCES ALUNOS(cpf_aluno),
    FOREIGN KEY (i_cpf) REFERENCES INSTRUTORES(cpf_instrutor),
    PRIMARY KEY(id_ficha, u_cpf)
);
COMMIT;