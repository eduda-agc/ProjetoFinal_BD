SELECT D.codigo, D.nome FROM Disciplina D
LEFT JOIN Ministrar M on D.codigo = M.disciplina_id
WHERE M.professor_id IS NULL;
