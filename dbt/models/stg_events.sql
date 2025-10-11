{{ config(materialized='table') }}
SELECT
  event_id,
  user_id,
  TIMESTAMP(event_ts) AS event_ts,
  event_name,
  JSON_EXTRACT_SCALAR(TO_JSON_STRING(properties), '$.product_id') AS product_id,
  SAFE_CAST(JSON_EXTRACT_SCALAR(TO_JSON_STRING(properties), '$.price') AS FLOAT64) AS price
FROM {{ source('raw','events') }}
