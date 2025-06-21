-- Média geral de um aluno específico (substitua '123' pelo ID do aluno)
SELECT 
    aluno_id,
    AVG(nota) AS media_notas
FROM 
    notas
WHERE 
    aluno_id = 123  -- Filtra por um aluno
GROUP BY 
    aluno_id;
