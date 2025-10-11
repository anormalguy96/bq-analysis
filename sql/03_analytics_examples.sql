WITH steps AS (
  SELECT
    user_id,
    MIN(IF(event_name='view_product', event_ts, NULL)) AS first_view,
    MIN(IF(event_name='add_to_cart', event_ts, NULL)) AS first_add,
    MIN(IF(event_name='begin_checkout', event_ts, NULL)) AS first_checkout,
    MIN(IF(event_name='purchase', event_ts, NULL)) AS first_purchase
  FROM `myproj.analytics.stg_events`
  GROUP BY user_id
)
SELECT
  COUNT(DISTINCT user_id) AS users_total,
  COUNTIF(first_view IS NOT NULL) AS viewed,
  COUNTIF(first_add IS NOT NULL) AS added,
  COUNTIF(first_checkout IS NOT NULL) AS began_checkout,
  COUNTIF(first_purchase IS NOT NULL) AS purchased,
  SAFE_DIVIDE(COUNTIF(first_purchase IS NOT NULL), COUNTIF(first_view IS NOT NULL)) AS conv_view_to_purchase
FROM steps;

WITH orders AS (
  SELECT user_id, DATE(order_ts) AS order_date FROM `myproj.analytics.stg_orders`
),
first_purchase AS (
  SELECT user_id, MIN(order_date) AS cohort_date FROM orders GROUP BY user_id
),
purchases AS (
  SELECT o.user_id, o.order_date FROM orders o
)
SELECT
  fp.cohort_date,
  DATE_DIFF(p.order_date, fp.cohort_date, DAY) AS day_offset,
  COUNT(DISTINCT p.user_id) AS active_users
FROM first_purchase fp
JOIN purchases p USING (user_id)
GROUP BY cohort_date, day_offset
ORDER BY cohort_date, day_offset
LIMIT 1000;

WITH orders AS (
  SELECT user_id, DATE(order_ts) AS order_date, total_amount FROM `myproj.analytics.stg_orders`
),
first_order AS (
  SELECT user_id, MIN(order_date) AS cohort_date FROM orders GROUP BY user_id
),
joined AS (
  SELECT fo.cohort_date, DATE_DIFF(o.order_date, fo.cohort_date, DAY) AS days_since, SUM(o.total_amount) AS revenue
  FROM first_order fo
  JOIN orders o USING (user_id)
  GROUP BY fo.cohort_date, days_since
)
SELECT cohort_date, days_since, SUM(revenue) OVER (PARTITION BY cohort_date ORDER BY days_since) AS cumulative_revenue
FROM joined
ORDER BY cohort_date, days_since
LIMIT 500;