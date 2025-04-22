-- This model generates a date dimension table with various date attributes.
-- It includes attributes such as year, month, day, fiscal quarter, and day of the week.
-- The date range is from January 1, 2014 to December 31, 2050.
-- The model uses the `generate_date_array` function to create a series of dates.
-- The model also includes a case statement to determine if a date is a weekday or weekend.
select 
  format_date('%F', d) as id,                         
  d as full_date,
  extract(year from d) as year,
  extract(week from d) as year_week,
  extract(month from d) as month,
  extract(day from d) as year_day,
  format_date("%Q", d) as fiscal_quarter,
  format_date("%B", d) as month_name,                  
  extract(dayofweek from d) as day_of_week_number,     
  format_date("%A", d) as day_name,                   
  case 
    when extract(dayofweek from d) in (1, 7) then 0     
    else 1 
  end as day_is_weekday
from (
  select * 
  from unnest(generate_date_array('2014-01-01', '2050-12-31', interval 1 day)) as d
)
