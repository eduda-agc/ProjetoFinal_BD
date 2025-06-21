CREATE TABLE Aluno (
  usuario_id     VARCHAR(10)       PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  nome_curso      VARCHAR(50),
  ano_ingresso    INTEGER     NOT NULL
);
