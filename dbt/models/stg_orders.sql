{{ config(materialized='table') }}
SELECT
  order_id,
  user_id,
  TIMESTAMP(order_ts) AS order_ts,
  total_amount,
  currency
FROM {{ source('raw','orders') }}