with cte1
as
(
select 
JobRole,
COUNT(Attrition) as attrition_count
from HR
where Attrition=1
group by JobRole)
,
cte2
as
(
select 
JobRole,
COUNT(Attrition) as total_attrition_count
from HR
group by JobRole
)
select 
cte1.jobrole,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.JobRole=cte2.JobRole
order by  attrition_rate


