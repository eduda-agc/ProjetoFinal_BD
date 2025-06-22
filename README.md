# Projeto Final Banco de Dados (SCC0240)
Projeto desenvolvido pelos integrantes do Grupo 4:

- Christian Bernard Simas Corrêa Gioia Ribeiro 11795572
- Eduarda Almeida Garrett de Carvalho 14566794
- Murilo Fonseca de Matos 13719065
- Pablo Felipe Montemor 13732352
___________________________________________________________________
## Pré-requisitos
- Sistema operacional: Ubuntu
- PostgreSQL instalado:
```
sudo apt update && sudo apt install postgresql postgresql-contrib
```
___________________________________________________________________
## Estrutura do Repositório
/DDL : comporta os scripts de definição de esquema (CREATE TABLE)
Cada tabela com seu próprio script com o modelo: create_nome_da_tabela.sql

/DML : comporta os scripts de inserção de dados (INSERT)
Cada tabela com seu próprio script com o modelo: inserts_nome_da_tabela.sql

/QUERIES : Consultas SQL para o Exercício 6

/INDEXES : Índices criados para Exercício 7

/VIEWS : Visões do Exercício 8
___________________________________________________________________
## Como executar os Scripts

###Como rodar (Assumindo instalacao do PostgresSQL):

Primeiramente crie o banco e as tabelas:
```bash
$ createdb Trab2
$ cd DDL/
$ psql -d Trab2 -f create_tables.sql
```
Após isso, popule as tabelas:

```bash
psql -d trab2 -f inserts_tables.sql
```

Sobre as Queries:

A querie lista_alunos.sql lista todos os alunos de um determinado curso que
entraram em um ano específico. Para executar basta rodar o script no terminal:

```bash
psql -d trab2 -f lista_alunos.sql
```
O resultado deve retornar uma tabela contendo o id, o curso e o ano de igresso do aluno

___________________________________________________________________

## Link do vídeo de demonstração
[9) Execução dos exercícios 6 ao 8](coloque o link aqui)
