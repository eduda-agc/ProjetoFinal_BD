CREATE TABLE Professor (
  usuario_id     INTEGER       PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  especializacao  VARCHAR(100),
  titulacao       VARCHAR(100)
);
