with cte
as
(
select
(case
	when Age <=29 then '18-29'
	when Age between 30 and 39 then '30-39'
	when Age between 40 and 49 then '40-49'
	when Age between 50 and 59 then '50-59'
	else '60 and greater'
	end) as Age_group,
	Attrition,
	YearsAtCompany 
from HR
),
cte2
as
(
select 
Age_group,
COUNT(Attrition) as attrition_count
from cte
where Attrition=1
group by Age_group
),
cte3
as
(
select 
Age_group,
COUNT(Attrition) as total_attrition_count
from cte
group by Age_group
)

select 
cte2.Age_group,
attrition_count,
total_attrition_count,
cast(attrition_count as float)/total_attrition_count as attrition_rate
from cte2 
inner join cte3
on cte2.Age_group=cte3.Age_group

-- 18-29,30-39  this group has highest attrition rate