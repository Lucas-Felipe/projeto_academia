# projeto_academia

API e Banco do projeto academia

## Utilizando o Docker

Certifique-se de ter o Docker e docker-compose instalados em sua máquina.  
No Diretório raiz, execute o comando:(se estiver executando pela primeira vez)  
`docker-compose build`

Em seguida execute o comando:  
`docker-compose up`

A url de acesso à API será mostrada no terminal assim que os conteiners estiverem sendo executados.

## Documentacão API:

Como utilizar as rotas REST:

As rotas podem ser acessadas através da url: `http://localhost:5000`

### /add_usuario

> adiciona usuário ao banco de dados  
> Método: POST  
> body json:

```json
{
  "cpf": "12345678910",
  "nome": "nome",
  "dt_inicio": "2021-09-14",
  "email": "email@email.com",
  "senha": "senha",
  "adm": false
}
```

### /add_aluno

> adiciona aluno ao banco de dados  
> Método: POST  
> body json:

```json
{
  "cpf": "12345678910",
  "nome": "nome",
  "dt_inicio": "2021-09-14",
  "email": "email@email.com",
  "senha": "senha",
  "adm": false,
  "altura": 1.7,
  "peso": 70,
  "n_cartao": "1234123412341234",
  "cpf_instrutor": "01987654321"
}
```

### /add_instrutor

> adiciona instrutor ao banco de dados  
> Método: POST  
> body json:

```json
{
  "cpf": "12345678910",
  "nome": "nome",
  "dt_inicio": "2021-09-14",
  "email": "email@email.com",
  "senha": "senha",
  "adm": false,
  "salario": 3000,
  "especializacao": "pilates",
  "conta": "ag. 123 cc. 456"
}
```

### /todos_exercicios

> Mostra uma lista com todos os exercícios cadastrados

### /add_exercicio

> Adiciona um exercício ao banco de dados  
> Método: POST  
> json body:

```json
{
  "nome": "nome do exercicio",
  "musculo": "musculo ativado"
}
```

### /add_frequencia

> adiciona um registro de frequência ao banco de dados  
> Método: POST  
> body json:

```json
{
  "hora_entrada": "07:40",
  "hora_saida": "18:40",
  "data": "2021/09/15",
  "u_cpf": "12345678910"
}
```

### /lista_alunos_com_instrutor

> Retorna a lista de todos os alunos com seus respectivos instrutores  
> Método: GET

### /instrutores_e_cont_alunos

> Retorna a lista de todos os instrutores quando alunos cada um possui  
> Método: GET

### /instrutores_n_alunos

> Retorna uma lista com instrutores que possuem um valor maior ou igual ao valor de alunos informado  
> Método: GET

```json
{
  "n_alunos": 3
}
```

### /todas_frequencias

> Retorna um log de todas as frequencias registradas  
> Método: GET

### /mostrar_todos_usuarios

> Retorna uma lista de todos os usuários cadastrados  
> Método: GET

### /fichas_de_aluno

> Retorna todas as fichas de um determinado aluno  
> Método: GET  
> body json:

```json
{
  "cpf": "12345678901"
}
```

### /ficha_dia_semana

> Retorna a ficha de determinado aluno em dia da semana informado  
> Método: GET  
> body json:

```json
{
  "cpf": "12345678901",
  "dia": "2021-09-14"
}
```

### /fichas_periodo

> Retorna as fichas de determinado aluno em um período especificado  
> Método: GET  
> body json:

```json
{
  "cpf": "12345678901",
  "dia_inicio": "2021-08-14",
  "dia_fim": "2021-09-14"
}
```

### /salarios

> Retorna uma tabela informando a soma dos salários, maior salário, menos salário, média salarial e número de instrutores cadastrados.  
> Método: GET
