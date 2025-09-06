--sellers = seller id / zip_code
-- order_items = seller/order/product_id  
-- orders = order/customer_id

SELECT t1.seller_id as vendedor,
        seller_state as estado,
        COUNT(t3.order_id) as total_vendas_Dez_2017,
        strftime('%Y-%m-%d', order_approved_at) AS Dez_2017

FROM tb_sellers as t1

LEFT JOIN tb_order_items as t2
    ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders as t3
    ON t2.order_id = t3.order_id

AND order_approved_at < '2018-01-01'
AND order_approved_at >= '2017-12-01'
AND order_status = 'delivered'

GROUP BY t1.seller_id
HAVING COUNT(t3.order_id) = 0
