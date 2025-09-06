-- qual o produto mais caro que o seller ja vendeu

-- qual prod que mais vendeu? :
--3095 vendedores

WITH tb_seller_product as (
        SELECT seller_id,
               product_id,
               COUNT(*) as qty_prod,
               (SUM(price)) as sum_price

        FROM tb_orders as t1

        LEFT JOIN tb_order_items as t2
             ON t1.order_id = t2.order_id

        WHERE order_status = 'delivered'

        GROUP BY seller_id,
                 product_id

        ORDER BY seller_id
),

    tb_seller_max as (

        SELECT seller_id,
        product_id,
        MAX(qty_prod) as max_qty_prod,
        sum_price

        FROM tb_seller_product

        GROUP BY seller_id

)

SELECT * FROM tb_seller_max