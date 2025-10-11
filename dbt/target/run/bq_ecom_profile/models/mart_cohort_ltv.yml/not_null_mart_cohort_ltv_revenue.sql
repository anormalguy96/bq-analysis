
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select revenue
from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
where revenue is null



  
  
      
    ) dbt_internal_test