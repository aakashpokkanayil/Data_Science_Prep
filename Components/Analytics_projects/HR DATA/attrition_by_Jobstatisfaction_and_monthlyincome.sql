with cte1
as
(
select
JobSatisfaction,
COUNT(*) as attrition_count
from HR
where Attrition=1 and MonthlyIncome <(select avg(cast(MonthlyIncome as int)) from HR)
group by JobSatisfaction
),
cte2
as
(
select
JobSatisfaction,
COUNT(*) as total_attrition_count
from HR
where  MonthlyIncome <(select avg(cast(MonthlyIncome as int))  from HR)
group by JobSatisfaction
)
select
cte1.JobSatisfaction,
attrition_count,
total_attrition_count,
cast(attrition_count as float)/total_attrition_count as attrition_rate
from cte1
inner join cte2
on cte1.JobSatisfaction=cte2.JobSatisfaction
order by attrition_rate desc

-- more than job satisfaction monthly income plays a vital role in attrition. 