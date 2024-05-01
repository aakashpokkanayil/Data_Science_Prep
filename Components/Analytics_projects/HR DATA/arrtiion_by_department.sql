with cte1
as
(
select 
Department,
count(Attrition) as attrition_count
from HR
where Attrition=1
group by Department
),
cte2
as (
select 
Department,
count(Attrition) as total_attrition_count
from HR
group by Department
)
select 
cte1.Department,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.Department=cte2.Department
order by  attrition_rate desc



-- it seems distance is not highly significant parameter 