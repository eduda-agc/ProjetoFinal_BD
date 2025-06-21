CREATE TABLE Curso (
  codigo              VARCHAR(10)   PRIMARY KEY,
  nome                VARCHAR(50)  NOT NULL,
  nivel_ensino        VARCHAR(50)   NOT NULL,
  carga_horaria       INTEGER       NOT NULL,
  nro_vagas           INTEGER       NOT NULL,
  frequencia_minima   DECIMAL(5,2),
  nota_maxima         DECIMAL(5,2),
  ementa              TEXT,
  cidade_unidade      VARCHAR(50),
  estado_unidade      VARCHAR(50),
  pais_unidade        VARCHAR(50),
  predio_unidade      VARCHAR(50),
  codigo_departamento VARCHAR(10)   NOT NULL
    REFERENCES Departamento(codigo)
);
