CREATE TABLE Administrador (
  usuario_id     INTEGER       PRIMARY KEY
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);
