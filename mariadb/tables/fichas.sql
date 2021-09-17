START TRANSACTION;
CREATE TABLE IF NOT EXISTS FICHAS(
    id_ficha INT AUTO_INCREMENT,
    n_repeticoes TINYINT,
    n_series TINYINT NOT NULL,
    peso FLOAT NOT NULL,
    a_cpf VARCHAR(11),
    FOREIGN KEY (a_cpf) REFERENCES ALUNOS(cpf_aluno),
    PRIMARY KEY(id_ficha, a_cpf)
);
COMMIT;