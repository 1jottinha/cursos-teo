--Ex 2: Qual o valor total de receita gerada por sellers
--de cada estado? Considere a base completa, com apenas 
--pedidos entregues

--orders = customer_id = customers
--orders = order_id = tb_order_items
--sellers = seller id

select 
        t3.seller_id as vendedor,
        t3.seller_state as estado,
        ROUND(SUM(t1.price), 2) as receita_total,
        ROUND( SUM(t1.price) / COUNT(DISTINCT (t3.seller_id)), 2 ) as receita_por_vendedor,
        COUNT(DISTINCT (t3.seller_id)) as qty_sellers

FROM tb_order_items as t1

LEFT JOIN tb_orders as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
ON t1.seller_id = t3.seller_id

WHERE t2.order_status = 'delivered'

GROUP BY seller_state
ORDER BY ROUND( SUM(t1.price) / COUNT(DISTINCT (t3.seller_id)), 2 ) DESC
