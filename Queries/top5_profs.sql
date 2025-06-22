SELECT p.usuario_id AS professor_id, u.nome || ' ' || u.sobrenome AS professor_nome, AVG(a.nota_geral)::NUMERIC(4,2) AS media_nota_geral FROM Professor P
JOIN Usuario U ON P.usuario_id = U.usuario_id
JOIN Avaliar A ON P.usuario_id = A.professor_id
GROUP BY
  P.usuario_id,
  U.nome,
  U.sobrenome
ORDER BY media_nota_geral DESC
LIMIT 5;

