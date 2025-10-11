
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select cohort_date, day_offset, revenue
from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
where revenue < 0
  
  
      
    ) dbt_internal_test