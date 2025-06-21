CREATE TABLE Curso_PreRequisito (
  curso_codigo       VARCHAR(10)   NOT NULL
    REFERENCES Curso(codigo)
    ON DELETE CASCADE,
  nome_pre_requisito VARCHAR(50)  NOT NULL,
  PRIMARY KEY (curso_codigo, nome_pre_requisito)
);
