with cte1
as
(
select
EnvironmentSatisfaction, 
RelationshipSatisfaction,
avg(cast(MonthlyIncome as float)) as attrition_monthly_income,
COUNT(*) as attrition_count
from HR
where Attrition=1
group by EnvironmentSatisfaction,RelationshipSatisfaction
),
cte2
as
(
select
EnvironmentSatisfaction, 
RelationshipSatisfaction,
avg(cast(MonthlyIncome as float)) as nonattrition_monthly_income,
COUNT(*) as total_attrition_count
from HR
group by EnvironmentSatisfaction,RelationshipSatisfaction
)
select
cte1.EnvironmentSatisfaction, 
cte1.RelationshipSatisfaction,
cte1.attrition_monthly_income,
cte2.nonattrition_monthly_income,
attrition_count,
total_attrition_count,
cast(attrition_count as float)/total_attrition_count as attrition_rate
from cte1
inner join cte2
on (cte1.EnvironmentSatisfaction=cte2.EnvironmentSatisfaction) and (cte1.RelationshipSatisfaction=cte2.RelationshipSatisfaction)
order by attrition_rate desc

