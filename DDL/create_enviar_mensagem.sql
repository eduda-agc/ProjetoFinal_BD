CREATE TABLE Enviar_Mensagem (
  mensagem_id     VARCHAR(10)  PRIMARY KEY,
  mensagem        TEXT         NOT NULL,
  timestamp       TIMESTAMP    NOT NULL,
  remetente_id    VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE,
  destinatario_id VARCHAR(10)  NOT NULL
    REFERENCES Usuario(usuario_id)
    ON DELETE CASCADE
);


