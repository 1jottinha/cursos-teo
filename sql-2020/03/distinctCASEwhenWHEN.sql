--

SELECT 
        DISTINCT CASE
                        WHEN product_category_name IS NULL THEN 'outros'

                        WHEN product_category_name = 'alimentos'
                                or product_category_name = 'alimentos_bebidas' THEN 'alimentos'

                        WHEN product_category_name IN ('artes', 'artes_e_artesanato') THEN 'artes'

                        WHEN product_category_name LIKE "%artigos%" then 'artigos'

                        ELSE product_category_name
                 END as fillna_category
 
FROM tb_products

ORDER BY 1
