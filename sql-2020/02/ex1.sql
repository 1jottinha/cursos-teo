--Ex1. Faça uma query que apresente o tamanho
--médio, máximo e mínimo da descrição do objeto por categoria

SELECT 
        product_category_name,
        count(*) as qty_prod,
        AVG(product_description_lenght) as avg_desc_len,
        MAX(product_description_lenght) as max_desc_len,
        MIN(product_description_lenght) as min_desc_len

FROM tb_products

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name 

