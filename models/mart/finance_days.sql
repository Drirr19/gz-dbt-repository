SELECT 
oo.date_date AS date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue),2) AS total_revenue,
ROUND(SUM(revenue) / COUNT(orders_id),2) AS avg_basket,
ROUND(SUM(Operational_margin),2) AS Operational_margin,
ROUND(SUM(purchase_cost),2) AS total_purchase_cost,
ROUND(SUM(sp.shipping_fee),2) AS total_shipping_fee,
ROUND(SUM(logcost),2) AS total_log_cost,
ROUND(SUM(om.quantity),2) AS total_quantity

FROM {{ref('int_orders_operational')}} oo
--LEFT JOIN avg_basket ab USING (orders_id)
LEFT JOIN {{ref('int_orders_margin')}} om USING (orders_id)
LEFT JOIN {{ref('stg_raw__ship')}} sp USING (orders_id)

GROUP BY oo.date_date
ORDER BY date DESC