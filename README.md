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

### /add_usuario

Método: POST  
json:

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

Método: POST  
json:

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

Método: POST  
json:

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

### /add_frequencia

Método: POST  
json:

```json
{
  "hora_entrada": "07:40",
  "hora_saida": "18:40",
  "data": "2021/09/15",
  "u_cpf": "12345678910"
}
```
