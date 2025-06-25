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
- Serviço do PostgrSQL ativo, se não estiver:
```
sudo systemctl start postgresql
sudo systemctl enable postgresql
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

### Como rodar (Assumindo instalacao do PostgresSQL):
Acesse o usuário postgres
```
sudo -i -u postgres
```
Crie o banco e as tabelas:
```bash
 createdb Trab2
 cd DDL/
 psql -d Trab2 -f create_tables.sql
```
Após isso, popule as tabelas:
```
psql -d Trab2 -f inserts_tables.sql
```

#### Queries - Exercício 6
As explicações dos seguintes códigos e suas lógicas estão presentes no pdf entregue do trabalho. 

##### 6.1 Lista todos os alunos de um determinado curso que entraram em um ano específico
```bash
psql -d Trab2 -f lista_alunos.sql
```

##### 6.2 Quais disciplinas ainda não têm professor atribuído? 
```
psql -d Trab2 -f disciplina_sem_prof.sql
```
##### 6.3 Quais professores do departamento DCC e em quais disciplinas eles estão ministrando? 
```
psql -d Trab2 -f profs_e_suas_disciplinas.sql
```

##### 6.4 Top 5 professores mais bem avaliados
```
psql -d Trab2 -f top5_profs.sql
```

##### 6.5 Quais alunos estão matriculados na disciplina D006 entre 1/02/2025 e 31/05/2025?
```
psql -d Trab2 -f matricula_em_data.sql
```

##### 6.6 Qual é a média geral das notas do aluno U025 em todas as disciplinas? 
```
psql -d Trab2 -f media_aluno.sql
```

##### 6.7 Qual o curso e departamento de cada disciplina? 
```
psql -d Trab2 -f curso_depart_disc.sql
```

___________________________________________________________________

## Link do vídeo de demonstração
[9) Execução dos exercícios 6 ao 8](https://youtu.be/-HPLNUt1INI)
