-- MIN, MAX, AVG

SELECT 
       product_category_name,
       count(*) as qty_prod,
       MAX(product_weight_g) as max_weight_prod,
       MIN(product_weight_g) as min_weight_prod,
       AVG(product_weight_g) as avg_weight_prod

FROM tb_products

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name 
