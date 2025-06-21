-- Consulta para listar alunos matriculados em uma disciplina específica
SELECT 
    a.id AS aluno_id,
    a.nome AS aluno_nome,
    a.matricula,
    d.nome AS disciplina_nome,
    d.codigo AS disciplina_codigo
FROM 
    alunos a
JOIN 
    matriculas m ON a.id = m.aluno_id
JOIN 
    disciplinas d ON m.disciplina_id = d.id
WHERE 
    d.codigo = 'DISC123'  -- Substitua pelo código ou nome da disciplina desejada
    -- ou: d.nome = 'Banco de Dados'
ORDER BY 
    a.nome;
