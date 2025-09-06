--Tempo entre vendas dos sellers

CREATE TABLE IF NOT EXISTS tb_avg_compra_seller AS

WITH tb_seller_order AS (

SELECT t1.order_id,
       customer_id,
       date(t1.order_approved_at) as data_venda,
       t2.seller_id

FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
     ON t2.order_id = t1.order_id

WHERE order_status = 'delivered'

),

tb_seller_order_sort AS (
        SELECT *,
                ROW_NUMBER() OVER(
                                PARTITION BY seller_id, data_venda
                
                            ) as date_seller_order

        FROM tb_seller_order
),

    tb_seller_lag_data AS (
    SELECT order_id,
        seller_id,
        data_venda,
        lag(data_venda) OVER(
                            PARTITION BY seller_id
                            ORDER BY data_venda
        ) AS lag_data_venda

    FROM tb_seller_order_sort
    WHERE date_seller_order = 1 --sem mais repeticao seller na mesma data
)

SELECT *,
       AVG(JULIANDAY(data_venda) - JULIANDAY(lag_data_venda)) as avg_diff_dias

FROM tb_seller_lag_data

WHERE lag_data_venda IS NOT NULL
GROUP BY seller_id
