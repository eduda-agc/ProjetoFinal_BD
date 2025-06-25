EXPLAIN SELECT
  *
FROM
  Enviar_Mensagem
WHERE
  destinatario_id = 'U004'
ORDER BY
  LENGTH(mensagem) DESC
LIMIT 1;
