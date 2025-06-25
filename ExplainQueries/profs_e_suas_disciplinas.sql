EXPLAIN SELECT  P.usuario_id AS professor_id, U.nome || ' ' || U.sobrenome AS professor_nome, D.nome AS disciplina_nome FROM  Professor P
JOIN  Usuario U  ON P.usuario_id = U.usuario_id
JOIN  Ministrar M  ON P.usuario_id = M.professor_id
JOIN  Disciplina D  ON M.disciplina_id = D.codigo
JOIN  Curso C  ON D.codigo_curso = C.codigo
WHERE  C.codigo_departamento = 'DCC';

