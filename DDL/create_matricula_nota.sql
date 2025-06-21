CREATE TABLE Matricula_Nota (
  nota_id           VARCHAR(10) NOT NULL,
  aluno_id          VARCHAR(10) NOT NULL,
  disciplina_id     VARCHAR(10) NOT NULL,
  tipo_nota         VARCHAR(50) NOT NULL,
  valor             DECIMAL(5,2),
  PRIMARY KEY (aluno_id, disciplina_id, nota_id),
  FOREIGN KEY (aluno_id, disciplina_id) REFERENCES Matricula_Disciplina(aluno_id, disciplina_id) ON DELETE CASCADE,
  UNIQUE (aluno_id, disciplina_id, tipo_nota)
);
