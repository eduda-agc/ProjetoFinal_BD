CREATE TABLE Enviar_Aviso (
  aviso_id         VARCHAR(10)  PRIMARY KEY,
  texto            TEXT         NOT NULL,
  timestamp        TIMESTAMP    NOT NULL,
  administrador_id VARCHAR(10)  NOT NULL
    REFERENCES Administrador(usuario_id)
    ON DELETE CASCADE,
  destinatario_id  VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);


