---create database HR_attrition


select * from hr

-- attrition happened count vs total emp count
select 
count(*) as totalempcount,
count(case when attrition=1 then 1 end) as attritioncount
from hr

-- out of 416 overtime people only 127 comes under attrition due to overtime 289 are not, so overtime not seems a highly imp col.
select 
count(case when overtime=1 then 1 end) as overtimecount,
count(case when (overtime=1 and attrition=1) then 1 end) attrition_overtime_count,
count(case when (attrition=1 and overtime=1) then 1 end) as noattrition_overtime_count
from hr


-- female vs male count

select gender,count(1) as 'count' from hr
group by gender;




select gender,count(1) as 'count' from hr
where attrition=1
group by gender;



select 
gender,(cast(count(gender) as float)/(select count(*) from hr))*100  as gender_count_percent
from hr
group by gender




