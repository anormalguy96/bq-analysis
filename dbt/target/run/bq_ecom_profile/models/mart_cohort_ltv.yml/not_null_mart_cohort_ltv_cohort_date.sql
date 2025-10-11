
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cohort_date
from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
where cohort_date is null



  
  
      
    ) dbt_internal_test