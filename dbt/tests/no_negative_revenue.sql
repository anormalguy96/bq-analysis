select cohort_date, day_offset, revenue
from {{ ref('mart_cohort_ltv') }}
where revenue < 0