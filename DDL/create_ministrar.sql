CREATE TABLE Ministrar (
  professor_id    INTEGER      NOT NULL
    REFERENCES Professor(usuario_id)
    ON DELETE CASCADE,
  disciplina_id   VARCHAR(10)  NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  gestao_id       INTEGER      NOT NULL
    REFERENCES Gestao(id_gestao)
    ON DELETE CASCADE,
  PRIMARY KEY (professor_id, disciplina_id, gestao_id)
);
