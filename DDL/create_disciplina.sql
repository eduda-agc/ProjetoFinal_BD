CREATE TABLE Disciplina (
  codigo            VARCHAR(10)   PRIMARY KEY,
  nome              VARCHAR(100)  NOT NULL,
  aulas_semanais    SMALLINT      NOT NULL,
  material_didatico TEXT,
  limite_vagas      INTEGER       NOT NULL,
  cidade_unidade    VARCHAR(50),
  estado_unidade    VARCHAR(50),
  pais_unidade      VARCHAR(50),
  predio_unidade    VARCHAR(50),
  codigo_curso      VARCHAR(10)   NOT NULL
    REFERENCES Curso(codigo)
);
