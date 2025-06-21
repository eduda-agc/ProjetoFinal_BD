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

