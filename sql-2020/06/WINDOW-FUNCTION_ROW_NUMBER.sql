--

-- qual o produto mais caro que o seller ja vendeu

-- qual prod que mais vendeu? :
--3095 vendedores

WITH tb_seller_product AS (
        SELECT seller_id,
               product_id,
               COUNT(*) AS qty_prod,
               (SUM(price)) AS sum_price

        FROM tb_orders AS t1

        LEFT JOIN tb_order_items AS t2
             ON t1.order_id = t2.order_id

        WHERE order_status = 'delivered'

        GROUP BY seller_id,
                 product_id

        ORDER BY seller_id
),

    tb_best_seller AS (
        SELECT *,
               ROW_NUMBER() OVER(
                    PARTITION BY seller_id
                    ORDER BY qty_prod DESC, sum_price DESC 
                         ) AS order_qty

        FROM tb_seller_product

)

SELECT seller_id,
       product_id,
       qty_prod,
       order_qty,
       sum_price

FROM tb_best_seller

WHERE order_qty = 1 /* ou <=5