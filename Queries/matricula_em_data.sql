SELECT a.usuario_id AS aluno_id, U.nome || ' ' || U.sobrenome AS aluno_nome, MD.data_matricula FROM  Matricula_Disciplina MD
JOIN Aluno A ON MD.aluno_id = A.usuario_id
JOIN Usuario U ON A.usuario_id = U.usuario_id
WHERE MD.disciplina_id = 'D006'
AND MD.data_matricula BETWEEN DATE '2025-02-01' AND DATE '2025-05-31';

