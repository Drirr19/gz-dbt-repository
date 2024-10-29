SELECT 
ROUND((s.quantity * p.purchase_price),2) AS pruchase_cost,
ROUND((s.revenue - (s.quantity * p.purchase_price)),2) AS margin

FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ ref('stg_raw__product') }} p ON p.products_id = s.product_id
