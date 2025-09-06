--

SELECT
        DISTINCT CASE
                WHEN product_category_name IS NULL THEN 'outros'
                ELSE product_category_name
        END as fillna_category
 
FROM tb_products

ORDER BY 1

/*order by 1 igual linha6*/
