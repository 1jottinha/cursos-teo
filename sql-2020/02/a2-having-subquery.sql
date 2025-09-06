-- uf seller HAVING

SELECT seller_state,
        count(seller_id) as qty_sellers

FROM tb_sellers

--filtro pre agregação
--WHERE seller_state IN ('SP', 'RJ', 'SC', 'AC')

GROUP BY seller_state

--filtro pos agregação
HAVING count(*) > 10

-- UF seller SubQuery

SELECT *

FROM (


    SELECT seller_state,
        count(seller_id) as qty_sellers

    FROM tb_sellers

    --WHERE seller_state IN ('SP', 'RJ', 'SC')

    GROUP BY seller_state

)

WHERE qty_sellers > 10
