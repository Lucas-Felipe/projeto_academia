INSERT INTO USUARIOS (cpf, nome, dt_inicio, email, senha, adm) 
VALUES ('05214874563', 'João Ferreira', '2020/05/12','joaocdferreira@gmail.com', 'jdout@QD9', FALSE),
       ('01200478631', 'Matheus Rodrigo', '2019/05/30','mmeusba.rodrigo@outlook.com', 'Mat#1998368', FALSE),
       ('10200612548', 'Bárbara Camargo', '2020/07/14','barbaramel12a@gmail.com', '155dakj@3DA', TRUE),
       ('25864831550', 'Gustavo Lima', '2021/08/01','gus.ferlima2@hotmail.com', 'DAKJgust1515@', FALSE),
       ('00789665603', 'Jardel Pereira', '2020/02/06','jardel.pereira@outlook.com', 'kkaddeJar!', FALSE),
       ('01047856610', 'Vitória Cabral', '2021/01/09','vitoriaccabral67@gmail.com', '@VitoriA1548', TRUE),
       ('18203648709', 'Melissa Gurgel', '2021/05/21','mel.santanagurgel@gmail.com', 'mel1998@SG', FALSE),
       ('01524856930', 'Tom Silva', '2019/10/20','tomsilva@live.com', 'TOMtom2015!', FALSE),
       ('12598654712', 'Marcos Galvão', '2020/11/01','marcos.margalvao@outlook.com', 'mM123#548G', FALSE),
       ('00885423642', 'João Oliveira', '2019/12/24','jjoliveira.joao@gmail.com', '2015@Joliveira', FALSE);

INSERT INTO INSTRUTORES (salario, especializacao, conta, cpf_instrutor) 
VALUES (1900.00, 'Muay-Thai', '15478-26', '05214874563'),
       (2820.00, 'Dança', '15478-26', '01200478631'),
       (3500.00, 'Musculação', '15478-26', '10200612548');

INSERT INTO ALUNOS (altura, peso, n_cartao, link_call, objetivo, cpf_aluno, cpf_instrutor) 
VALUES (1.67, 65.4, '00015', 'academia.com/aluno258', 'Ganhar massa muscular', '25864831550', '10200612548'),
       (1.72, 81.2, '00016', 'academia.com/aluno007', 'Perder peso', '00789665603', '01200478631'),
       (1.67, 79.1, '00017', 'academia.com/aluno010', 'Ganhar força', '01047856610', '05214874563'),
       (1.67, 62.6, '00018', 'academia.com/aluno182', 'Ganhar massa muscular', '18203648709', '10200612548'),
       (1.67, 74.6, '00019', 'academia.com/aluno015', 'Ganhar resistência', '01524856930', '05214874563'),
       (1.67, 95.7, '00020', 'academia.com/aluno125', 'Perder peso', '12598654712', '01200478631'),
       (1.67, 65.3, '00020', 'academia.com/aluno008', 'Ganhar força', '00885423642', '05214874563');

INSERT INTO FREQUENCIAS (hora_entrada, hora_saida, data_, u_cpf) 
VALUES ('07:09', '08:39', '2021/02/08', '25864831550'),
       ('06:41', '07:59', '2021/05/08', '25864831550'),
       ('09:39', '10:52', '2020/04/12', '00789665603'),
       ('16:41', '18:12', '2020/05/01', '00789665603'),
       ('19:15', '22:03', '2021/08/13', '01047856610'),
       ('18:35', '19:48', '2021/09/01', '01047856610'),
       ('07:10', '09:12', '2021/07/04', '18203648709'),
       ('06:29', '07:54', '2021/06/11', '18203648709'),
       ('06:37', '08:22', '2019/12/30', '01524856930'),
       ('09:55', '12:01', '2019/12/03', '01524856930'),
       ('15:46', '18:02', '2021/07/15', '12598654712'),
       ('16:32', '17:41', '2021/08/13', '12598654712'),
       ('20:03', '22:10', '2021/05/02', '00885423642'),
       ('20:06', '21:58', '2021/04/06', '00885423642');

INSERT INTO PAGAMENTOS (id_pagamento, dt_pagamento, forma, valor, cpf_cliente)
VALUES (1, '2019/11/10', 'cartão', 70, '01524856930'),
       (2, '2019/12/10', 'cartão', 70, '01524856930'),
       (3, '2019/12/24', 'cartão', 70, '00885423642'),
       (4, '2020/01/24', 'cartão', 70, '00885423642'),
       (5, '2020/02/28', 'débito', 65, '00789665603'),
       (6, '2020/03/28', 'débito', 65, '00789665603'),
       (7, '2020/11/25', 'cartão', 70, '12598654712'),
       (8, '2020/12/26', 'cartão', 70, '12598654712'),
       (9, '2021/01/09', 'cartão', 70, '01047856610'),
       (10, '2021/02/09', 'cartão', 70, '01047856610'),
       (11, '2021/05/21', 'cartão', 70, '18203648709'),
       (12, '2021/06/21', 'cartão', 70, '18203648709'),
       (13, '2021/08/20', 'cartão', 70, '25864831550'),
       (14, '2021/08/20', 'cartão', 70, '25864831550');

INSERT INTO FICHAS (n_repeticoes, n_series, peso, a_cpf)
VALUES ( 12, 5, 10.5, '25864831550'),
        ( 10, 3, 8.5, '12598654712'),
        ( 15, 4, 15, '12598654712'),
        ( 10, 3, 8.5, '25864831550'),
        ( 12, 3, 10, '00789665603'),
        ( 15, 4, 15, '01047856610'),
        ( 20, 4, 10.5, '00789665603'),
        ( 30, 3, 12.5, '01047856610'),
        ( 25, 3, 15, '18203648709'),
        ( 15, 4, 20, '18203648709'),
        ( 12, 5, 10, '01524856930'),
        ( 20, 4, 12, '01524856930'),
        ( 25, 3, 8.5, '00885423642'),
        ( 30, 3, 9, '00885423642');


INSERT INTO TREINOS (dia_semana, id_ficha, u_cpf, i_cpf)
VALUES ('2021/02/08', 00001, '25864831550', '10200612548'),
       ('2021/05/08', 00002, '25864831550', '10200612548'),
       ('2020/04/12', 00003, '00789665603', '01200478631'),
       ('2020/05/01', 00004, '00789665603', '01200478631'),
       ('2021/08/13', 00005, '01047856610', '05214874563'),
       ('2021/09/01', 00006, '01047856610', '05214874563'),
       ('2021/07/04', 00007, '18203648709', '10200612548'),
       ('2021/06/11', 00008, '18203648709', '10200612548'),
       ('2019/12/30', 00009, '01524856930', '05214874563'),
       ('2019/12/03', 00010, '01524856930', '05214874563'),
       ('2021/07/15', 00011, '12598654712', '01200478631'),
       ('2021/08/13', 00012, '12598654712', '01200478631'),
       ('2021/05/02', 00013, '00885423642', '05214874563'),
       ('2021/04/06', 00014, '00885423642', '05214874563');


INSERT INTO EXERCICIOS (nome, musculo)
VALUES ('Exercício aeróbico', 'Corpo todo'),
       ('Flexões', 'Braço'),
       ('Abdominais', 'Abdomen'),
       ('Agachamento', 'Glúteo'),
       ('Stiff', 'Abdutores'),
       ('Elevação de ombros', 'Ombro'),
       ('Rosca direta', 'Bíceps'),
       ('Supino reto', 'Peito'),
       ( 'Leg-press', 'Glúteo'),
       ('Agachamendo sumô', 'Glúteo');

INSERT INTO CONTEM ( id_exercicio,id_ficha )
VALUES (06, 00001), 
       (04, 00001), 
       (01, 00002), 
       (03, 00002), 
       (05, 00003), 
       (07, 00003), 
       (10, 00004),
       (05, 00004),
       (05, 00005),
       (03, 00005),
       (07, 00006),
       (08, 00006),
       (09, 00007),
       (10, 00007),
       (10, 00008),
       (09, 00008),
       (01, 00009),
       (03, 00009),
       (05, 00010),
       (07, 00010),
       (08, 00011),
       (10, 00011),
       (03, 00012),
       (04, 00012),
       (01, 00013),
       (06, 00013),
       (09, 00014),
       (01, 00014);
       
