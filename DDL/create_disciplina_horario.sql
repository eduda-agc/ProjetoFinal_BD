CREATE TABLE Disciplina_Horario (
  disciplina_codigo VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  horario           VARCHAR(50)  NOT NULL,
  PRIMARY KEY (disciplina_codigo, horario)
);
