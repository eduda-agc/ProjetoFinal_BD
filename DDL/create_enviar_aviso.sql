CREATE TABLE Enviar_Aviso (
  aviso_id         SERIAL       PRIMARY KEY,
  texto            TEXT         NOT NULL,
  timestamp        TIMESTAMP    NOT NULL,
  administrador_id INTEGER      NOT NULL
    REFERENCES Administrador(usuario_id)
    ON DELETE CASCADE,
  destinatario_id  INTEGER      NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);


