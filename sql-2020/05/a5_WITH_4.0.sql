
WITH tb_best_categoria as (

            SELECT t1.product_category_name
            FROM tb_products AS t1

            LEFT JOIN tb_order_items AS t2
                ON t1.product_id = t2.product_id

            GROUP BY t1.product_category_name
            ORDER BY COUNT(*) DESC
            LIMIT 3

)

SELECT * FROM tb_best_categoria