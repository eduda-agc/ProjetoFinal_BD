CREATE VIEW Aluno_Disciplinas_Matriculadas AS
SELECT 
    a.usuario_id,
    u.nome || ' ' || u.sobrenome AS nome_aluno,
    d.codigo AS codigo_disciplina,
    d.nome AS nome_disciplina,
    md.data_matricula,
    md.status
FROM 
    Aluno a
JOIN 
    Usuario u ON a.usuario_id = u.usuario_id
JOIN 
    Matricula_Disciplina md ON a.usuario_id = md.aluno_id
JOIN 
    Disciplina d ON md.disciplina_id = d.codigo;