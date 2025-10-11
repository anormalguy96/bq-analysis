
SELECT
  order_id,
  user_id,
  TIMESTAMP(order_ts) AS order_ts,
  total_amount,
  currency
FROM `elmaddin-bq-demo`.`raw`.`orders`