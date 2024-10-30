SELECT
  EXTRACT(MONTH FROM date_date) AS mois,
  ROUND(SUM(ads_margin),2) AS ads_margin,
  ROUND(AVG(avg_basket),2) AS avg_basket,
  ROUND(SUM(operational_margin),2) AS operational_margin,
  ROUND(SUM(ads_cost),2) AS ads_cost,
  ROUND(SUM(ads_impression),2) AS ads_impression,
  ROUND(SUM(ads_clicks),2) AS ads_clicks,
  ROUND(SUM(total_quantity),2) AS quantity,
  ROUND(SUM(total_revenue),2) AS revenue,
  ROUND(SUM(total_purchase_cost),2) AS purchase_cost,
  ROUND(SUM(total_margin),2) AS margin,
  ROUND(SUM(total_shipping_fee),2) AS shipping_fee,
  ROUND(SUM(total_log_cost),2) AS log_cost,
  ROUND(SUM(total_ship_cost),2) AS ship_cost
FROM {{ ref('finance_campaigns_day') }} cd
GROUP BY mois
ORDER BY mois DESC