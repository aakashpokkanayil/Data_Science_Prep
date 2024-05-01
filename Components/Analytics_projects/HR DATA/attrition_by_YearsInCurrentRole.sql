with cte1
as
(
select
YearsInCurrentRole,
COUNT(*) as attrition_count
from HR
where Attrition=1
group by YearsInCurrentRole
),
cte2
as
(
select
YearsInCurrentRole,
COUNT(*) as total_attrition_count
from HR
group by YearsInCurrentRole
)
select
cte1.YearsInCurrentRole,
attrition_count,
total_attrition_count,
cast(attrition_count as float)/total_attrition_count as attrition_rate
from cte1
inner join cte2
on cte1.YearsInCurrentRole=cte2.YearsInCurrentRole
order by attrition_rate desc

--seems YearsInCurrentRole and attrition rate are inversly proportional. 