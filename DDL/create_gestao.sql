CREATE TABLE Gestao (
  id_gestao         VARCHAR(10)       PRIMARY KEY,
  tipo_acao         VARCHAR(50)  NOT NULL,
  status            VARCHAR(20)  NOT NULL,
  administrador_id  INTEGER      NOT NULL
    REFERENCES Administrador(usuario_id)
    ON DELETE RESTRICT
);
