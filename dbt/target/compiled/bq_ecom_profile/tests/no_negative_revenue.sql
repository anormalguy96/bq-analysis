select cohort_date, day_offset, revenue
from `elmaddin-bq-demo`.`analytics`.`mart_cohort_ltv`
where revenue < 0