CREATE VIEW Matriculas_Notas_Alunos AS
SELECT 
    md.aluno_id,
    u.nome || ' ' || u.sobrenome AS nome_aluno,
    a.nome_curso,
    md.disciplina_id,
    d.nome AS nome_disciplina,
    mn.tipo_nota,
    mn.valor AS nota,
    md.status AS status_matricula
FROM 
    Matricula_Disciplina md
JOIN 
    Aluno a ON md.aluno_id = a.usuario_id
JOIN 
    Usuario u ON a.usuario_id = u.usuario_id
JOIN 
    Disciplina d ON md.disciplina_id = d.codigo
LEFT JOIN 
    Matricula_Nota mn ON md.aluno_id = mn.aluno_id AND md.disciplina_id = mn.disciplina_id;