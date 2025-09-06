-- SELECT * FROM tb_sellers limit 10 #seleciona tudo e limite de 10

SELECT product_id,
       product_photos_qty,
       product_category_name

FROM tb_products

WHERE (product_category_name = 'bebes'
    AND product_photos_qty > 1)
OR (product_category_name = 'brinquedos'
    AND product_photos_qty > 5)

--Ex1: Quantos produtos temos da categoria 'artes'?

SELECT count(*) as qty_itens,
       count(product_id) as qty_prod,
       count(DISTINCT product_id) as qty_dist_prod,
       count(DISTINCT product_category_name) as qty_dist_categ

FROM tb_products 

WHERE product_category_name = 'artes'

--Ex2: Quantos produtos tem mais de 5 litros?

--product_length_cm * product_height_cm * product_width_cm / 1000 as prod_volum

select count(*),
       count(DISTINCT product_id)
       

from tb_products

WHERE product_length_cm * product_height_cm * product_width_cm / 1000 > 5

--Ex3: Crie uma coluna nova que contenha a informação de volume em m3


SELECT
product_id,
product_length_cm * product_height_cm * product_width_cm / 1000000 as prod_volum_m3,
product_category_name,
product_name_lenght,
product_description_lenght,
product_photos_qty,
product_weight_g,
product_length_cm,
product_height_cm,
product_width_cm

FROM tb_products

--Ex4: Quantos produtos de 'beleza_saude' com menos de 1 litro?

SELECT count(*)

FROM tb_products

WHERE product_category_name = 'beleza_saude'
AND product_length_cm*product_height_cm*product_width_cm / 1000 < 1