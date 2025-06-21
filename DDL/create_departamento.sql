CREATE TABLE Departamento (
  codigo          VARCHAR(10)   PRIMARY KEY,
  nome            VARCHAR(50)  NOT NULL,
  chefe_id        VARCHAR(10)       NOT NULL
    REFERENCES Professor(usuario_id)
);
