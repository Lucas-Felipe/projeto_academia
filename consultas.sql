SELECT *
    FROM FREQUENCIAS, USUARIOS
    WHERE u_cpf = '05214874563'; 

-- listar os dados dos alunos
SELECT U.nome, A.altura, A.peso, A.objetivo, A.link_call, U.email
    FROM ALUNOS AS A, USUARIOS AS U
    WHERE cpf = cpf_aluno;

-- Lista todos os instrutores    
SELECT U.nome, I.especializacao, U.dt_inicio, U.email 
    FROM INSTRUTORES AS I, USUARIOS AS U
    WHERE cpf = cpf_instrutor; 

-- Lista todos os exercicios
SELECT *
    FROM academia.EXERCICIOS;

-- Buscar exercício por músculo
SELECT id_exercicio , nome, musculo 
FROM EXERCICIOS
WHERE UPPER(musculo) = 'OMBRO';

-- Iserir novo exercicio
INSERT INTO EXERCICIOS (nome, musculo)
VALUES ('nome do exercicio', 'músculo ativado');

-- selecionar ficha de treino por usuario 
SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf='00789665603' AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;

--selecionar ficha de treino por usuario em um dia especifico
SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf='00789665603' AND T.dia_semana='2021-05-08' AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;

-- selecionar fichas de treino de um usuario em um periodo especifico
SELECT U.nome, F.n_repeticoes, F.n_series, F.peso, T.dia_semana, E.nome, E.musculo
FROM USUARIOS AS U, ALUNOS AS A, INSTRUTORES AS I, TREINOS AS T, FICHAS AS F, EXERCICIOS AS E, CONTEM  AS C
WHERE U.cpf='00789665603' AND T.dia_semana>='2021-05-08' AND T.dia_semana <='2021-07-04' AND A.cpf_instrutor=I.cpf_instrutor AND A.cpf_aluno=T.u_cpf AND
T.id_ficha=F.id_ficha AND F.id_ficha=C.id_ficha AND C.id_exercicio=E.id_exercicio;

-- Criar novo treino para aluno
INSERT INTO FICHAS (n_repeticoes, n_series, peso, a_cpf) VALUES (55,55, 10, '12598654712');
INSERT INTO TREINOS (dia_semana, id_ficha, u_cpf, i_cpf) VALUES ('2021/09/17', (SELECT id_ficha FROM academia.FICHAS ORDER BY id_ficha DESC LIMIT 1), '12598654712', '10200612548');
INSERT INTO CONTEM (id_exercicio, id_ficha) VALUES (1, (SELECT id_ficha FROM academia.FICHAS ORDER BY id_ficha DESC LIMIT 1));

/*consulta de alunos e seus instrutores*/
SELECT  U2.nome as nome_aluno, A.cpf_aluno,A.altura ,A.peso ,A.objetivo, I.cpf_instrutor ,
    U.nome as nome_instrutor from academia.ALUNOS as A 
left join academia.USUARIOS as U2 on U2.cpf =A.cpf_aluno 
left join academia.INSTRUTORES as I using (cpf_instrutor)
left join academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
ORDER BY U.nome;
 
/*Contagem de alunos por instrutor*/
SELECT U.nome, I.especializacao, COUNT(A.cpf_aluno) as contagem_de_alunos from academia.INSTRUTORES as I
left join academia.ALUNOS as A on A.cpf_instrutor =I.cpf_instrutor 
LEFT JOIN academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
GROUP by I.cpf_instrutor;

/*Frequencias por aluno*/
SELECT * from academia.FREQUENCIAS as F
left join academia.USUARIOS as U on U.cpf =F.u_cpf 
ORDER by U.nome;

/*Consultar todos os usuários*/
-- SELECT * from academia.USUARIOS as U;
SELECT cpf, nome, dt_inicio, email, adm from USUARIOS; -- não mostra senha

/*Quantidade de dias de frequencia por aluno*/
SELECT F.*,U.nome,COUNT(F.data_)as Qte_dias FROM academia.FREQUENCIAS as F
LEFT JOIN academia.USUARIOS as U on U.cpf =F.u_cpf 
GROUP BY F.u_cpf;

/*Sugestão para consulta de fichas*/
SELECT U.nome as nome_aluno,U2.nome as nome_instrutor,F.id_ficha as num_ficha,F.n_repeticoes ,F.n_series ,
    F.peso ,T.dia_semana,E.nome as nome_exercicio FROM academia.FICHAS as F
left join academia.USUARIOS as U on U.cpf =F.a_cpf 
LEFT JOIN academia.ALUNOS as A on A.cpf_aluno =U.cpf 
LEFT JOIN academia.INSTRUTORES as I on I.cpf_instrutor =A.cpf_instrutor 
LEFT JOIN academia.USUARIOS as U2 on U2.cpf =I.cpf_instrutor 
LEFT JOIN academia.TREINOS as T on T.id_ficha =F.id_ficha 
LEFT JOIN academia.CONTEM as C on C.id_ficha =F.id_ficha 
LEFT JOIN academia.EXERCICIOS as E on E.id_exercicio=C.id_exercicio;


-- usando funções de agrgação para salário do professor
SELECT SUM(salario), MAX(salario), MIN(salario), AVG(salario), COUNT(*)
    FROM INSTRUTORES;


-- recuperar o nome de instutores que possuem trÊs ou mais alunos - uso de subconsulta 
SELECT U.nome
FROM USUARIOS AS U, INSTRUTORES AS I 
WHERE U.cpf = cpf_instrutor AND 
                                (SELECT COUNT(*)
                                 FROM ALUNOS AS A
                                 WHERE A.cpf_instrutor = I.cpf_instrutor) >=3; 


-- pendentes de pagar o mes, para os que pagou é só trocar por "Exists"
SELECT U.nome, U.cpf 
FROM USUARIOS AS U, ALUNOS AS A 
WHERE U.cpf = A.cpf_aluno AND NOT EXISTS (SELECT *
                                      FROM PAGAMENTOS
                                      WHERE U.cpf = cpf_cliente AND dt_pagamento LIKE  '2021-08-__');

-- atualizar um instutor de um aluno 
UPDATE ALUNOS 
set cpf_instrutor = '01200478631'
WHERE cpf_aluno = '01047856610';

-- reverter atualização de cima 
UPDATE ALUNOS 
set cpf_instrutor = '05214874563'
WHERE cpf_aluno = '01047856610';

-- delete uma frequencia 
DELETE FREQUENCIAS 
WHERE u_cpf = '01524856930' AND data_ = '2019-12-03';

--reverter o delete 
INSERT INTO FREQUENCIAS (hora_entrada, hora_saida, data_, u_cpf) 
VALUES ('09:55', '12:01', '2019/12/03', '01524856930');