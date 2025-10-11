
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select day_offset
from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
where day_offset is null



  
  
      
    ) dbt_internal_test