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
