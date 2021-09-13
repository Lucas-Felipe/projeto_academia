START TRANSACTION;
USE academia;
COMMIT;
START TRANSACTION;
CREATE TABLE IF NOT EXISTS INSTRUTORES(
    salario FLOAT,
    especializacao VARCHAR(20),
    conta VARCHAR(30),
    cpf_instrutor INT,
    FOREIGN KEY (cpf_instrutor) REFERENCES USUARIOS(cpf),
    PRIMARY KEY(cpf_instrutor)
);
COMMIT;