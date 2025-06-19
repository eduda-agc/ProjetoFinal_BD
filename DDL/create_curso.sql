CREATE TABLE Curso (
  codigo              VARCHAR(10)   PRIMARY KEY,
  nome                VARCHAR(100)  NOT NULL,
  nivel_ensino        VARCHAR(50)   NOT NULL,
  carga_horaria       INTEGER       NOT NULL,
  nro_vagas           INTEGER       NOT NULL,
  frequencia_minima   DECIMAL(5,2),
  nota_maxima         DECIMAL(5,2),
  ementa              TEXT,
  pre_requisitos      TEXT,
  cidade_unidade      VARCHAR(50),
  estado_unidade      VARCHAR(50),
  pais_unidade        VARCHAR(50),
  predio_unidade      VARCHAR(50),
  sala_aula           VARCHAR(50),
  laboratorio         BOOLEAN,
  projetor            BOOLEAN,
  lousa_digital       BOOLEAN,
  codigo_departamento VARCHAR(10)   NOT NULL
    REFERENCES Departamento(codigo)
);

