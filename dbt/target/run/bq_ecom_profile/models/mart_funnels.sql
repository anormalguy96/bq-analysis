
  
    

    create or replace table `elmaddin-bq-demo`.`analytics`.`mart_funnels`
      
    
    

    
    OPTIONS()
    as (
      
WITH steps AS (
  SELECT
    user_id,
    MIN(IF(event_name='view_product', event_ts, NULL)) AS first_view,
    MIN(IF(event_name='add_to_cart', event_ts, NULL)) AS first_add,
    MIN(IF(event_name='begin_checkout', event_ts, NULL)) AS first_checkout,
    MIN(IF(event_name='purchase', event_ts, NULL)) AS first_purchase
  FROM `elmaddin-bq-demo`.`analytics`.`stg_events`
  GROUP BY user_id
)
SELECT
  user_id,
  first_view, first_add, first_checkout, first_purchase,
  CASE
    WHEN first_purchase IS NOT NULL THEN 'purchased'
    WHEN first_checkout IS NOT NULL THEN 'checkout'
    WHEN first_add IS NOT NULL THEN 'added'
    WHEN first_view IS NOT NULL THEN 'viewed'
    ELSE 'none'
  END AS funnel_stage
FROM steps
    );
  