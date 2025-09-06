
SELECT
        DISTINCT coalesce(product_category_name, 'outros') as fillna_category

FROM tb_products

ORDER BY 1

/*  COALESCE(tel_cel, tel_cel2, tel1, tel2, 0 /eh nao encontrado) */