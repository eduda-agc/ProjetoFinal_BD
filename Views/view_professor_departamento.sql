CREATE VIEW Professores_Departamentos AS
SELECT 
    p.usuario_id,
    u.nome || ' ' || u.sobrenome AS nome_professor,
    d.nome AS nome_departamento
FROM 
    Professor p
JOIN 
    Usuario u ON p.usuario_id = u.usuario_id
JOIN 
    Departamento d ON p.usuario_id = d.chefe_id;
