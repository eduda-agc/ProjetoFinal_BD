CREATE TABLE Avaliar (
  aluno_id          VARCHAR(10)   NOT NULL
    REFERENCES Aluno(usuario_id)
    ON DELETE CASCADE,
  professor_id      VARCHAR(10)   NOT NULL
    REFERENCES Professor(usuario_id)
    ON DELETE CASCADE,
  comentario        TEXT,
  nota_geral        DECIMAL(3,2),
  nota_material     DECIMAL(3,2),
  grau_relevancia   DECIMAL(3,2),
  nota_infra        DECIMAL(3,2),
  PRIMARY KEY (aluno_id, professor_id)
);


