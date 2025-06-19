CREATE TABLE Aluno (
  usuario_id     INTEGER       PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  nome_curso      VARCHAR(100),
  ano_ingresso    SMALLINT     NOT NULL
);
