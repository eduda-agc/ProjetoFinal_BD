INSERT INTO Matricular (
  aluno_id, disciplina_id, gestao_id, data_matricula,
  status, notas, bolsa_desconto, confirmada, cancelada
) VALUES
  (21, 'ALG1',     1, '2024-07-01', 'Matriculado', 'A', 500.00, TRUE,  FALSE),
  (22, 'CAL1',     2, '2024-07-01', 'Matriculado', 'B', 300.00, TRUE,  FALSE),
  (23, 'ADM101',   1, '2024-07-02', 'Matriculado', 'B+', 0.00, TRUE,  FALSE),
  (24, 'BIO101',   2, '2024-07-02', 'Matriculado', 'A-', 200.00, TRUE,  FALSE),
  (25, 'ENGC101',  1, '2024-07-03', 'Pendente',    NULL, 0.00, FALSE, FALSE),
  (26, 'PED101',   2, '2024-07-03', 'Matriculado', 'B', 0.00, TRUE,  FALSE),
  (27, 'MUS101',   1, '2024-07-04', 'Matriculado', 'A', 100.00, TRUE,  FALSE),
  (28, 'LET101',   2, '2024-07-04', 'Cancelado',   NULL, 0.00, FALSE, TRUE),
  (29, 'SOC101',   1, '2024-07-05', 'Matriculado', 'C+', 0.00, TRUE,  FALSE),
  (30, 'ART101',   2, '2024-07-05', 'Matriculado', 'B-', 0.00, TRUE,  FALSE),
  (31, 'CAL1',     1, '2024-07-06', 'Matriculado', 'B+', 50.00, TRUE,  FALSE),
  (32, 'ALG1',     2, '2024-07-06', 'Matriculado', 'A', 0.00, TRUE,  FALSE),
  (33, 'ENGC101',  1, '2024-07-07', 'Pendente',    NULL, 0.00, FALSE, FALSE),
  (34, 'LET101',   2, '2024-07-07', 'Matriculado', 'A-', 120.00, TRUE,  FALSE),
  (35, 'BIO101',   1, '2024-07-08', 'Cancelado',   NULL, 0.00, FALSE, TRUE);
