-- Quais clientes mais perderam pontos por Lover?

SELECT t1.IdCliente,
       sum(t1.QtdePontos) AS totalPontos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

WHERE t2.IdProduto IN (1.0, 13.0)

GROUP BY t1.IdCliente

ORDER BY sum(t1.QtdePontos) ASC

LIMIT 10