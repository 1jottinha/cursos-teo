-- a receita por estado do seller, 
--por produto da categoria mais vendida
--use apenas vendas entregues

WITH tb_best_categoria as (

        SELECT t1.product_category_name
        FROM tb_products AS t1

        LEFT JOIN tb_order_items AS t2
            ON t1.product_id = t2.product_id

        GROUP BY t1.product_category_name
        ORDER BY COUNT(*) DESC
        LIMIT 3

),

tb_vendas as (

                SELECT *

                FROM tb_orders as t1

                WHERE order_status = 'delivered'

),

tb_receita_estado_produto as (

                SELECT t2.seller_state,
                       ROUND(SUM(t1.price), 2) AS receita_total,
                       t1.product_id,
                       t3.product_category_name

                FROM tb_order_items AS t1

                LEFT JOIN tb_sellers AS t2
                    ON t1.seller_id = t2.seller_id

                LEFT JOIN tb_products AS t3
                    ON t1.product_id = t3.product_id

                INNER JOIN tb_vendas as t4
                    ON t1.order_id = t4.order_id

                GROUP BY t2.seller_state,
                         t1.product_id,
                         t3.product_category_name

)

SELECT *

FROM tb_receita_estado_produto AS t1

INNER JOIN tb_best_categoria AS t2
    ON t1.product_category_name = t2.product_category_name