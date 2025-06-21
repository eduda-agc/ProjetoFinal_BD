CREATE TABLE Usuario (
  usuario_id        VARCHAR(10)       PRIMARY KEY,
  nome              VARCHAR(50)  NOT NULL,
  sobrenome         VARCHAR(50)  NOT NULL,
  telefone          VARCHAR(50)  NOT NULL,
  rua_usuario       VARCHAR(50),
  nro_usuario       VARCHAR(20),
  CEP_usuario       VARCHAR(20),
  cidade_usuario    VARCHAR(50),
  data_nascimento   DATE,
  sexo              CHAR(1),
  email             VARCHAR(50),
  senha             VARCHAR(50),
  cidade_unidade    VARCHAR(50),
  estado_unidade    VARCHAR(50),
  pais_unidade      VARCHAR(50),
  predio_unidade    VARCHAR(50),
  UNIQUE (nome, sobrenome, telefone)
);

CREATE TABLE Administrador (
  usuario_id     VARCHAR(10)  PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);
CREATE TABLE Aluno (
  usuario_id     VARCHAR(10)       PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  nome_curso      VARCHAR(50),
  ano_ingresso    INTEGER     NOT NULL
);
CREATE TABLE Professor (
  usuario_id     VARCHAR(10)  PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  especializacao  VARCHAR(50),
  titulacao       VARCHAR(50)
);
CREATE TABLE Departamento (
  codigo          VARCHAR(10)   PRIMARY KEY,
  nome            VARCHAR(50)  NOT NULL,
  chefe_id        VARCHAR(10)       NOT NULL
    REFERENCES Professor(usuario_id)
);
CREATE TABLE Curso (
  codigo              VARCHAR(10)   PRIMARY KEY,
  nome                VARCHAR(50)  NOT NULL,
  nivel_ensino        VARCHAR(50)   NOT NULL,
  carga_horaria       INTEGER       NOT NULL,
  nro_vagas           INTEGER       NOT NULL,
  frequencia_minima   DECIMAL(5,2),
  nota_maxima         DECIMAL(5,2),
  ementa              TEXT,
  cidade_unidade      VARCHAR(50),
  estado_unidade      VARCHAR(50),
  pais_unidade        VARCHAR(50),
  predio_unidade      VARCHAR(50),
  codigo_departamento VARCHAR(10)   NOT NULL
    REFERENCES Departamento(codigo)
);
CREATE TABLE Curso_PreRequisito (
  curso_codigo       VARCHAR(10)   NOT NULL
    REFERENCES Curso(codigo)
    ON DELETE CASCADE,
  nome_pre_requisito VARCHAR(50)  NOT NULL,
  PRIMARY KEY (curso_codigo, nome_pre_requisito)
);
CREATE TABLE Disciplina (
  codigo            VARCHAR(10)   PRIMARY KEY,
  nome              VARCHAR(50)  NOT NULL,
  limite_vagas      INTEGER       NOT NULL,
  cidade_unidade    VARCHAR(50),
  estado_unidade    VARCHAR(50),
  pais_unidade      VARCHAR(50),
  predio_unidade    VARCHAR(50),
  codigo_curso      VARCHAR(10)   NOT NULL
    REFERENCES Curso(codigo)
);
CREATE TABLE Disciplina_Material (
  disciplina_codigo VARCHAR(10)   NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  material_nome     VARCHAR(50)  NOT NULL,
  PRIMARY KEY (disciplina_codigo, material_nome)
);
CREATE TABLE Disciplina_Horario (
  disciplina_codigo VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  horario           VARCHAR(50)  NOT NULL,
  PRIMARY KEY (disciplina_codigo, horario)
);
CREATE TABLE Infraestrutura (
  curso_codigo  VARCHAR(10)  NOT NULL
    REFERENCES Curso(codigo)
    ON DELETE CASCADE,
  sala_aula     VARCHAR(50) NOT NULL,
  laboratorio   BOOLEAN,
  projetor      BOOLEAN,
  lousa_digital BOOLEAN,
  PRIMARY KEY (curso_codigo, sala_aula)
);
CREATE TABLE Gestao (
  id_gestao         VARCHAR(10)       PRIMARY KEY,
  tipo_acao         VARCHAR(50)  NOT NULL,
  status            VARCHAR(20)  NOT NULL,
  administrador_id  VARCHAR(10)  NOT NULL
    REFERENCES Administrador(usuario_id)
    ON DELETE RESTRICT
);
CREATE TABLE Matricula_Disciplina (
  aluno_id        VARCHAR(10)      NOT NULL
    REFERENCES Aluno(usuario_id)
    ON DELETE CASCADE,
  disciplina_id   VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  data_matricula  DATE         NOT NULL,
  status          VARCHAR(20),
  bolsa_desconto  DECIMAL(5,2),
  confirmada      BOOLEAN,
  cancelada       BOOLEAN,
  PRIMARY KEY (aluno_id, disciplina_id)
);
CREATE TABLE Matricula_Gestao (
  aluno_id        VARCHAR(10)      NOT NULL,
  disciplina_id   VARCHAR(10)  NOT NULL,
  gestao_id       VARCHAR(10)      NOT NULL
    REFERENCES Gestao(id_gestao)
    ON DELETE CASCADE,
  PRIMARY KEY (aluno_id, disciplina_id, gestao_id),
  FOREIGN KEY (aluno_id, disciplina_id) REFERENCES Matricula_Disciplina(aluno_id, disciplina_id) ON DELETE CASCADE
);
CREATE TABLE Matricula_Nota (
  nota_id           VARCHAR(10) NOT NULL,
  aluno_id          VARCHAR(10) NOT NULL,
  disciplina_id     VARCHAR(10) NOT NULL,
  tipo_nota         VARCHAR(50) NOT NULL,
  valor             DECIMAL(5,2),
  PRIMARY KEY (aluno_id, disciplina_id, nota_id),
  FOREIGN KEY (aluno_id, disciplina_id) REFERENCES Matricula_Disciplina(aluno_id, disciplina_id) ON DELETE CASCADE,
  UNIQUE (aluno_id, disciplina_id, tipo_nota)
);
CREATE TABLE Avaliar (
  aluno_id          VARCHAR(10)   NOT NULL
    REFERENCES Aluno(usuario_id)
    ON DELETE CASCADE,
  professor_id      VARCHAR(10)   NOT NULL
    REFERENCES Professor(usuario_id)
    ON DELETE CASCADE,
  comentario        TEXT,
  nota_geral        DECIMAL(3,2),
  nota_material     DECIMAL(3,2),
  grau_relevancia   DECIMAL(3,2),
  nota_infra        DECIMAL(3,2),
  PRIMARY KEY (aluno_id, professor_id)
);


CREATE TABLE Enviar_Aviso (
  aviso_id         VARCHAR(10)  PRIMARY KEY,
  texto            TEXT         NOT NULL,
  timestamp        TIMESTAMP    NOT NULL,
  administrador_id VARCHAR(10)  NOT NULL
    REFERENCES Administrador(usuario_id)
    ON DELETE CASCADE,
  destinatario_id  VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);
CREATE TABLE Enviar_Mensagem (
  mensagem_id     VARCHAR(10)  PRIMARY KEY,
  mensagem        TEXT         NOT NULL,
  timestamp       TIMESTAMP    NOT NULL,
  remetente_id    VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  destinatario_id VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);


CREATE TABLE Ministrar (
  professor_id    VARCHAR(10)  NOT NULL
    REFERENCES Professor(usuario_id)
    ON DELETE CASCADE,
  disciplina_id   VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  gestao_id       VARCHAR(10)  NOT NULL
    REFERENCES Gestao(id_gestao)
    ON DELETE CASCADE,
  PRIMARY KEY (professor_id, disciplina_id, gestao_id)
);
