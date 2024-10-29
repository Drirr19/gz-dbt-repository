SELECT
orders_id,
date_date,
ROUND((margin - shipping_fee - logcost - ship_cost),2) AS Operational_margin

FROM {{ref('int_orders_margin')}} om 
LEFT JOIN {{ref('stg_raw__ship')}} sp USING (orders_id)

ORDER BY date_date DESC