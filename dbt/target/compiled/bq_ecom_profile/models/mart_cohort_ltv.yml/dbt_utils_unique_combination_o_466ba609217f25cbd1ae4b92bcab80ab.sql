





with validation_errors as (

    select
        cohort_date, day_offset
    from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
    group by cohort_date, day_offset
    having count(*) > 1

)

select *
from validation_errors


