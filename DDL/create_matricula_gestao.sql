CREATE TABLE Matricula_Gestao (
  aluno_id        VARCHAR(10)      NOT NULL,
  disciplina_id   VARCHAR(10)  NOT NULL,
  gestao_id       VARCHAR(10)      NOT NULL
    REFERENCES Gestao(id_gestao)
    ON DELETE CASCADE,
  PRIMARY KEY (aluno_id, disciplina_id, gestao_id),
  FOREIGN KEY (aluno_id, disciplina_id) REFERENCES Matricula_Disciplina(aluno_id, disciplina_id) ON DELETE CASCADE
);
