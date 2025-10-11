{{ config(materialized='table') }}

WITH user_orders AS (
    SELECT
        user_id,
        DATE_TRUNC(order_ts, DAY) AS order_date,
        order_ts,
        total_amount AS revenue
    FROM {{ source('raw', 'orders') }}
),

cohorts AS (
    SELECT
        user_id,
        MIN(DATE_TRUNC(order_ts, DAY)) AS cohort_date
    FROM {{ source('raw', 'orders') }}
    GROUP BY 1
),

ltv_calc AS (
    SELECT
        c.cohort_date,
        DATE_DIFF(DATE_TRUNC(u.order_ts, DAY), c.cohort_date, DAY) AS day_offset,
        COUNT(DISTINCT u.user_id) AS active_users,
        SUM(u.revenue) AS revenue
    FROM user_orders u
    JOIN cohorts c
      ON u.user_id = c.user_id
    GROUP BY 1, 2
)

SELECT
    l.cohort_date,
    l.day_offset,
    l.active_users,
    SAFE_DIVIDE(l.revenue, NULLIF(l.active_users, 0)) AS avg_ltv_per_user,
    l.revenue
FROM ltv_calc l
ORDER BY l.cohort_date, l.day_offset