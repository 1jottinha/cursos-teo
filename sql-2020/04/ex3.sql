--Ex3
--Qual o peso médio dos produtos vendidos por sellers 
--de cada estado? Considere apenas o ano de 2017 e 
--pedidos entregues nesta análise.

--tb_products= product_id ( product_weight_g )
--tb_seller= seller)_id
--tb_orders= order/customer)_id ( approved_at/status)
--tb_order_items= order/product/seller)_id

SELECT
        --t4.seller_id as vendedor,
        t4.seller_state as estado,
        t1.order_approved_at as data_venda,
        ROUND(AVG(t3.product_weight_g), 2) as avg_prod_weigth,
        AVG(t3.product_weight_g) / COUNT(DISTINCT (t4.seller_id)) as avgWeigth_perSeller


FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

LEFT JOIN tb_products as t3
    ON t2.product_id = t3.product_id

LEFT JOIN tb_sellers as t4
    ON t2.seller_id = t4.seller_id


WHERE t1.order_status = 'delivered'
AND strftime('%Y', t1.order_approved_at) = '2017'

GROUP BY t4.seller_state
ORDER BY 4 DESC
