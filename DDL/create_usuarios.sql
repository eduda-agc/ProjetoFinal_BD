CREATE TABLE Usuario (
  usuario_id       SERIAL       PRIMARY KEY,
  nome              VARCHAR(50)  NOT NULL,
  sobrenome         VARCHAR(50)  NOT NULL,
  telefone          VARCHAR(20)  NOT NULL,
  rua_usuario       VARCHAR(100),
  nro_usuario       VARCHAR(10),
  CEP_usuario       VARCHAR(10),
  cidade_usuario    VARCHAR(50),
  data_nascimento   DATE,
  sexo              CHAR(1),
  email             VARCHAR(100),
  senha             VARCHAR(128),
  cidade_unidade    VARCHAR(50),
  estado_unidade    VARCHAR(50),
  pais_unidade      VARCHAR(50),
  predio_unidade    VARCHAR(50),
  UNIQUE (nome, sobrenome, telefone)
);

