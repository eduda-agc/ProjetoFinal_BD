CREATE TABLE Disciplina_Material (
  disciplina_codigo VARCHAR(10)   NOT NULL
    REFERENCES Disciplina(codigo)
    ON DELETE CASCADE,
  material_nome     VARCHAR(50)  NOT NULL,
  PRIMARY KEY (disciplina_codigo, material_nome)
);
