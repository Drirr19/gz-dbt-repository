SELECT 
orders_id,
date_date,
ROUND(SUM(revenue),2) AS revenue,
ROUND(SUM(quantity),2) AS quantity,
ROUND(SUM(pruchase_cost),2) AS purchase_cost,
ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }} sm
GROUP BY orders_id, date_date 
ORDER BY date_date DESC