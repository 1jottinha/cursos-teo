-- a receita por estado do seller, 
--por produto da categoria mais vendida

SELECT
        t2.seller_state,
        ROUND(SUM(t1.price), 2) as receita_total,
        t1.product_id


from tb_order_items as t1

LEFT JOIN tb_sellers as t2
    ON t1.seller_id = t2.seller_id

LEFT JOIN tb_products as t3
    ON t1.product_id = t3.product_id

WHERE product_category_name = 'cama_mesa_banho'

GROUP BY t2.seller_state,
         t1.product_id;

-- OUTRA QUERY PARA DESCOBRIR A CATEGORIA MAIS VENDIDA
-- e DEPOIS filtrar apenas a categoria na query acima

SELECT
        t1.product_category_name,
        COUNT(*)


FROM tb_products as t1

LEFT JOIN tb_order_items as t2
    ON t1.product_id = t2.product_id

GROUP BY t1.product_category_name
ORDER BY COUNT(*) DESC
limit 1