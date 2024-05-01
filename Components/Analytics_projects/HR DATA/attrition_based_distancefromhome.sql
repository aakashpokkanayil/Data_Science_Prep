with cte1
as
(
select 
DistanceFromHome,
count(Attrition) as attrition_count
from HR
where Attrition=1
group by DistanceFromHome
),
cte2
as (
select 
DistanceFromHome,
count(Attrition) as total_attrition_count
from HR
group by DistanceFromHome
)
select 
cte1.DistanceFromHome,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.DistanceFromHome=cte2.DistanceFromHome
order by  attrition_rate desc



-- it seems distance is not highly significant parameter 