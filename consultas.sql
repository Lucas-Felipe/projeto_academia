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

/*consulta de alunos e seus instrutores*/
SELECT  U2.nome as nome_aluno, A.cpf_aluno,A.altura ,A.peso ,A.objetivo, I.cpf_instrutor ,
    U.nome as nome_instrutor from academia.ALUNOS as A 
left join academia.USUARIOS as U2 on U2.cpf =A.cpf_aluno 
left join academia.INSTRUTORES as I using (cpf_instrutor)
left join academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
ORDER BY U.nome 
 
/*Contagem de alunos por instrutor*/
SELECT I.*,U.nome,COUNT(A.cpf_aluno) as contagem_de_alunos from academia.INSTRUTORES as I
left join academia.ALUNOS as A on A.cpf_instrutor =I.cpf_instrutor 
LEFT JOIN academia.USUARIOS as U on U.cpf =I.cpf_instrutor 
GROUP by I.cpf_instrutor 

/*Frequencias por aluno*/
SELECT * from academia.FREQUENCIAS as F
left join academia.USUARIOS as U on U.cpf =F.u_cpf 
ORDER by U.nome 

/*Consultar todos os usuários*/
SELECT * from academia.USUARIOS as U

/*Quantidade de dias de frequencia por aluno*/
SELECT F.*,U.nome,COUNT(F.data_)as Qte_dias FROM academia.FREQUENCIAS as F
LEFT JOIN academia.USUARIOS as U on U.cpf =F.u_cpf 
GROUP BY F.u_cpf 

/*Sugestão para consulta de fichas*/
SELECT U.nome as nome_aluno,U2.nome as nome_instrutor,F.id_ficha as num_ficha,F.n_repeticoes ,F.n_series ,
    F.peso ,T.dia_semana,E.nome as nome_exercicio FROM academia.FICHAS as F
left join academia.USUARIOS as U on U.cpf =F.a_cpf 
LEFT JOIN academia.ALUNOS as A on A.cpf_aluno =U.cpf 
LEFT JOIN academia.INSTRUTORES as I on I.cpf_instrutor =A.cpf_instrutor 
LEFT JOIN academia.USUARIOS as U2 on U2.cpf =I.cpf_instrutor 
LEFT JOIN academia.TREINOS as T on T.id_ficha =F.id_ficha 
LEFT JOIN academia.CONTEM as C on C.id_ficha =F.id_ficha 
LEFT JOIN academia.EXERCICIOS as E on E.id_exercicio=C.id_exercicio 