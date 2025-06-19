CREATE TABLE Enviar_Mensagem (
  mensagem_id     SERIAL       PRIMARY KEY,
  mensagem        TEXT         NOT NULL,
  timestamp       TIMESTAMP    NOT NULL,
  remetente_id    INTEGER      NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  destinatario_id INTEGER      NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);


