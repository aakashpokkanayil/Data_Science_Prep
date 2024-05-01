with cte1
as
(
select 
EducationField,
count(Attrition) as attrition_count
from HR
where Attrition=1
group by EducationField
),
cte2
as (
select 
EducationField,
count(Attrition) as total_attrition_count
from HR
group by EducationField
)
select 
cte1.EducationField,
cast(cast(attrition_count as float)/total_attrition_count* 100 as float) as attrition_rate ,
attrition_count,
total_attrition_count
from cte1 
inner join cte2
on cte1.EducationField=cte2.EducationField
order by  attrition_rate desc

