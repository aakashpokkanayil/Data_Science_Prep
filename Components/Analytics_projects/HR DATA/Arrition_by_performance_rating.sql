 --- there are 1244 emp got 3 rating out of that 200 resigned, and there are 200+ got 4 rating out of that 37 ressigned.
 --percentage wise no diffrence

 select 
 count(attrition) as attrition_count,
 PerformanceRating,
 attrition 
 from hr
 group by PerformanceRating,attrition;

 with cte1
 as
 (
 select 
 count(attrition) as attrition_count,
 (
	select	case when PerformanceRating=3 
			then ((select count(*) from HR where PerformanceRating=3))
			else ((select count(*) from HR where PerformanceRating=4))
			end
	 ) as total_count,
 PerformanceRating,
 attrition 
 from HR
 group by PerformanceRating,attrition
 )
 select 
 attrition_count,
 total_count,
 cast(attrition_count as float)/total_count as attrition_rate,
 PerformanceRating 
 from cte1 
 where attrition=1;