--Ex1 Qual o valor total de receita gerada por clientes
--de cada estado? Considere a base completa, 
--com apenas pedidos entregues

--tb_orders = (order/customer)_id, status 
--tb_customers = (customer/_unique)_id
--tb_order_items = (order/order_item/product/seller)_id
--, price

--PRICE per CUSTOMER each STATE where DELIVERED

SELECT
        t1.customer_id as cliente,
        t1.order_status as status,
        ROUND(SUM(t2.price) / COUNT(DISTINCT t1.customer_id), 2) as receita_por_cliente,
        t3.customer_state as estado

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
        ON t1.order_id = t2.order_id

LEFT JOIN tb_customers as t3
        ON t3.customer_id = t1.customer_id

WHERE t1.order_status = 'delivered'

GROUP BY t3.customer_state
ORDER BY ROUND(SUM(t2.price) / COUNT(DISTINCT t1.customer_id), 2) DESC