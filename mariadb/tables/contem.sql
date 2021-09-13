START TRANSACTION;
CREATE TABLE IF NOT EXISTS CONTEM(
    id_exercicio INT,
    id_ficha INT,
    FOREIGN KEY (id_exercicio) REFERENCES EXERCICIO(id_exercicio),
    FOREIGN KEY (id_ficha) REFERENCES FICHAS(id_ficha),
    PRIMARY KEY(id_ficha, id_exercicio)
);
COMMIT;