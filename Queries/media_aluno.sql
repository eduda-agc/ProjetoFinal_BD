SELECT MD.aluno_id, ROUND(AVG(mn.valor)::NUMERIC, 2) AS media_geral_notas FROM Matricula_Nota MN
JOIN Matricula_Disciplina MD ON MN.aluno_id = MD.aluno_id AND MN.disciplina_id = MD.disciplina_id
GROUP BY MD.aluno_id;

