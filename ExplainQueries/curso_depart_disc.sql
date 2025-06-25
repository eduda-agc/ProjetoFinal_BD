EXPLAIN SELECT D.nome AS nome_disciplina, C.nome AS nome_curso, DP.nome AS nome_departamento FROM Disciplina D
JOIN Curso C ON D.codigo_curso = C.codigo
JOIN Departamento DP ON C.codigo_departamento = DP.codigo;

