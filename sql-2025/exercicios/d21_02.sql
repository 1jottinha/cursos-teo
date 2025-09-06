-- Quais clientes assinaram a lista de presença no dia 2025/08/25?

SELECT t1.IdCliente,
       t1.DtCriacao

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t2.IdTransacao = t1.IdTransacao

LEFT JOIN produtos AS t3
    ON t3.IdProduto = t2.IdProduto

WHERE DtCriacao >= '2025-08-25 00:00:00'
    AND DtCriacao <  '2025-08-26 00:00:00'
    AND t3.DescProduto = 'Lista de presença'

GROUP BY IdCliente;

-- Gabarito TEO:
-- SELECT t1.IdCliente,
--        count(*) 
-- 
-- FROM transacoes AS t1
-- 
-- LEFT JOIN transacao_produto AS t2
-- ON t1.IdTransacao = t2.IdTransacao
-- 
-- LEFT JOIN produtos AS t3
-- ON t2.IdProduto = t3.IdProduto
-- 
-- WHERE substr(t1.DtCriacao,1,10) = '2025-08-25'
-- AND t3.DescProduto = 'Lista de presença'
-- 
-- GROUP BY t1.IdCliente