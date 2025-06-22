CREATE VIEW Curso_Departamento_Chefe AS
SELECT 
    c.codigo AS codigo_curso,
    c.nome AS nome_curso,
    d.codigo AS codigo_departamento,
    d.nome AS nome_departamento,
    u.nome || ' ' || u.sobrenome AS nome_chefe
FROM 
    Curso c
JOIN 
    Departamento d ON c.codigo_departamento = d.codigo
JOIN 
    Usuario u ON d.chefe_id = u.usuario_id;