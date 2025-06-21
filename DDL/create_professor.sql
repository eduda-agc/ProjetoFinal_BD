CREATE TABLE Professor (
  usuario_id     VARCHAR(10)  PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  especializacao  VARCHAR(50),
  titulacao       VARCHAR(50)
);
