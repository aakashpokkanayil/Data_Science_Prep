with cte1
as
(
select 
MaritalStatus,
count(Attrition) as attrition_count
from HR
where Attrition=1
group by MaritalStatus
),
cte2
as (
select 
MaritalStatus,
count(Attrition) as total_attrition_count
from HR
group by MaritalStatus
)
select 
cte1.MaritalStatus,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.MaritalStatus=cte2.MaritalStatus
order by  attrition_rate desc

