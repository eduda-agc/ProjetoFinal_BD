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
