SELECT 
    usuario_id AS "ID do Aluno",
    nome_curso AS "Curso",
    ano_ingresso AS "Ano de Ingresso"
FROM 
    Aluno
WHERE 
    nome_curso = 'Ciência da Computação'
    AND ano_ingresso = 2022
ORDER BY 
    usuario_id;
