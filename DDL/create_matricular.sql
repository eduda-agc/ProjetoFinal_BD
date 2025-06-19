CREATE TABLE Matricular (
  aluno_id        INTEGER      NOT NULL
    REFERENCES Aluno(usuario_id)
    ON DELETE CASCADE,
  disciplina_id   VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  gestao_id       INTEGER      NOT NULL
    REFERENCES Gestao(id_gestao)
    ON DELETE CASCADE,
  data_matricula  DATE         NOT NULL,
  status          VARCHAR(20),
  notas           TEXT,
  bolsa_desconto  DECIMAL(8,2),
  confirmada      BOOLEAN,
  cancelada       BOOLEAN,
  PRIMARY KEY (aluno_id, disciplina_id, gestao_id)
);


