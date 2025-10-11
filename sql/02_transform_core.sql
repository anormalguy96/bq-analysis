CREATE OR REPLACE TABLE `myproj.analytics.stg_events` AS
SELECT
  event_id,
  user_id,
  TIMESTAMP(event_ts) AS event_ts,
  event_name,
  JSON_EXTRACT_SCALAR(TO_JSON_STRING(properties), '$.product_id') AS product_id,
  SAFE_CAST(JSON_EXTRACT_SCALAR(TO_JSON_STRING(properties), '$.price') AS FLOAT64) AS price,
  properties
FROM `myproj.raw.events`;

CREATE OR REPLACE TABLE `myproj.analytics.stg_orders` AS
SELECT
  order_id,
  user_id,
  TIMESTAMP(order_ts) AS order_ts,
  total_amount,
  currency,
  items
FROM `myproj.raw.orders`;