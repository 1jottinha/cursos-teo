-- a receita por estado do seller, 
--por produto da categoria mais vendida

SELECT
        t2.seller_state,
        ROUND(SUM(t1.price), 2) AS receita_total,
        t1.product_id,
        t3.product_category_name

FROM tb_order_items AS t1

LEFT JOIN tb_sellers AS t2
    ON t1.seller_id = t2.seller_id

LEFT JOIN tb_products AS t3
    ON t1.product_id = t3.product_id

WHERE product_category_name = (
                                SELECT
                                t1.product_category_name

                                FROM tb_products AS t1

                                LEFT JOIN tb_order_items AS t2
                                    ON t1.product_id = t2.product_id

                                GROUP BY t1.product_category_name
                                ORDER BY COUNT(*) DESC
                                LIMIT 1
                              )

GROUP BY t2.seller_state,
         t1.product_id,
         t3.product_category_name