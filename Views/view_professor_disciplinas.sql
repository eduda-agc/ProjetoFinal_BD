CREATE VIEW Professor_Disciplinas_Gestao AS
SELECT 
    p.usuario_id,
    u.nome || ' ' || u.sobrenome AS nome_professor,
    d.codigo AS codigo_disciplina,
    d.nome AS nome_disciplina,
    g.tipo_acao,
    g.status
FROM 
    Professor p
JOIN 
    Usuario u ON p.usuario_id = u.usuario_id
JOIN 
    Ministrar m ON p.usuario_id = m.professor_id
JOIN 
    Disciplina d ON m.disciplina_id = d.codigo
JOIN 
    Gestao g ON m.gestao_id = g.id_gestao;