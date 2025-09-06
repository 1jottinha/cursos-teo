-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e pedidos?
-- considerando as vendas de 2017 e pedidos entregues

SELECT 
       t2.product_category_name,

        SUM(t1.price) as receita,

        COUNT(*) as total_sells,
        COUNT(DISTINCT t1.order_id) as pedidos,
        ROUND(COUNT(*) / cast(COUNT(DISTINCT t1.order_id) as float), 2) as avg_item_pedido

FROM tb_order_items as t1

LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id

LEFT JOIN tb_orders as t3
    ON t1.order_id = t3.order_id
WHERE order_status = 'delivered'
AND strftime("%Y", order_approved_at) = '2017'

GROUP BY t2.product_category_name
ORDER BY SUM(t1.price) DESC
