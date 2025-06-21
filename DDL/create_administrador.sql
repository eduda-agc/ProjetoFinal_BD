CREATE TABLE Administrador (
  usuario_id     VARCHAR(10)  PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);
