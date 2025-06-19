CREATE TABLE Departamento (
  codigo          VARCHAR(10)   PRIMARY KEY,
  nome            VARCHAR(100)  NOT NULL,
  chefe_id        INTEGER       NOT NULL
    REFERENCES Professor(usuario_id)
);
