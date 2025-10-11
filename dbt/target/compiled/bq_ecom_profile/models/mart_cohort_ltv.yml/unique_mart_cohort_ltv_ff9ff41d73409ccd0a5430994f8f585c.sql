
    
    

with dbt_test__target as (

  select (CAST(cohort_date AS STRING) || '-' || CAST(day_offset AS STRING)) as unique_field
  from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
  where (CAST(cohort_date AS STRING) || '-' || CAST(day_offset AS STRING)) is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


