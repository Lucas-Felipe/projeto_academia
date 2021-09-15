SELECT *
    FROM FREQUENCIAS, USUARIOS
    WHERE u_cpf = '05214874563'; 

SELECT *
    FROM ALUNOS, USUARIOS
    WHERE cpf = cpf_aluno;
    
SELECT *
    FROM INSTRUTORES, USUARIOS
    WHERE cpf = cpf_instrutor; 

-- selecionar ficha de treino por usuario 
SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf='00789665603' AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;

