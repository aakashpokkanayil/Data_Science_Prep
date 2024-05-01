with cte1
as
(
select 
PercentSalaryHike,
count(Attrition) as attrition_count
from HR
where Attrition=1
group by PercentSalaryHike
),
cte2
as (
select 
PercentSalaryHike,
count(Attrition) as total_attrition_count
from HR
group by PercentSalaryHike
)
select 
cte1.PercentSalaryHike,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.PercentSalaryHike=cte2.PercentSalaryHike
order by  attrition_rate desc

