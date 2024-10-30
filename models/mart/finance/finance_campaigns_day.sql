SELECT 
date_date,
ROUND((total_margin - ads_cost - total_log_cost - total_ship_cost + total_shipping_fee),2) AS ads_margin,
avg_basket,
ROUND((total_margin - total_log_cost - total_ship_cost + total_shipping_fee )) as operational_margin,
--Operational_margin,
ads_cost,
ads_impression,
ads_clicks,
total_quantity,
total_revenue,
total_purchase_cost,
total_margin,
total_shipping_fee,
total_log_cost,
total_ship_cost


FROM {{ref("int_campaigns_day")}} cd 
LEFT JOIN {{ref("finance_days")}} fd ON cd.date_date = fd.date

ORDER BY date DESC