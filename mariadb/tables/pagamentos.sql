START TRANSACTION;
CREATE TABLE IF NOT EXISTS PAGAMENTOS(
    id_pagamento INT PRIMARY KEY,
    dt_pagamento DATE NOT NULL,
    forma VARCHAR(10) NOT NULL,
    valor FLOAT NOT NULL,
    cpf_cliente VARCHAR(11),
    FOREIGN KEY (cpf_cliente) REFERENCES ALUNOS(cpf_aluno)
);
COMMIT;