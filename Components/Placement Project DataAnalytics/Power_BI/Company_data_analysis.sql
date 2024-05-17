--create index idx_director
--on Book1(Director_ID)




with cte as
(
select Company_Name,(case when Retirement_Age_Directors_Years ='NULL' then 0 else 1 end) as is_disclosed from Book1
),
x as
(
select 
Company_Name,
max(is_disclosed) as  'disclosed_count'
from cte 
group by  Company_Name
--order by Company_Name
)
--select 
--count( case when disclosed_count=0 then 1 end ) as '0 count',
--count( case when disclosed_count=1 then 1 end ) as '1 count'
--from x
select distinct Company_Name from Book1 where Retirement_Age_Directors_Years='NULL'
and 
Company_Name not in (
select  Company_Name from x where disclosed_count=0)

select * from Book1

--2956
select 1824+1132
select 1945+1132

select distinct Company_Name from Book1 where Retirement_Age_Directors_Years='NULL'

select count(distinct Director_ID) from Book1

select 14010+13941+4690+1126

with cte
as
(
select
(
case 
when Age <=40 or Age is null then '40 Years or Below'
when Age>=41 and Age<=60 then '41 to 60 Years'
when Age>=61 and Age<=72 then '61 to 72 Years'
else 'Above 72 Years'
end
) as age_group,
Director_ID,
Age,
FY_Data
from 
Book1
)
select age_group,count(distinct Director_ID)
from cte
where FY_Data='FY_3'
group by age_group

select 14010+1126+4690+13941
select 10364+722+3521+10878
select 9302+515+3250+10170
select 9119+504+3013+9713

select Director_ID,COUNT(distinct Age) from Book1
where FY_Data='FY_1'
group by Director_ID
having COUNT(distinct Age)>1

select 10364+722+3521+10878

select Director_ID,FY_Data,count(Age)
from Book1
group by Director_ID,FY_Data
order by Director_ID

30450

select count(distinct Director_ID)
from Book1


select 10364+722+3521+10878

select 12124+13859+3405+1062



--Age disclossed pie:
-- 0 and 1  contains  some common company, coz same company have both non disclose polysy and well as they disclassed also. 

-- director by age group
-- each FY age of director changes so min age of director is taken
-- also found that in same financial year same director have diffrent age.

-- Find out Male vs Female Director share in different Industry_Sectors and Revenue_Category

	--In given range "$1B to < $3B" was missing i added it

--Revenue Catrgory - 
--Below $100M
--$100M to < $300M
--$300M to < $1B
--$1B to < $3B
--$3B to < $10B
--$10B to < $20B
--$20 B and Above

100,000,000


	select Gender,Industry_Sector,AVG(Revenue)
	from Book1
	where Gender != 'NULL'
	group by Industry_Sector,Gender
	order by Industry_Sector

	select Director_ID,
	Gender,
	Industry_Sector,
	AVG(Revenue) as 'Avg_Revenue',
	(case when AVG(Revenue) < 100000000 then 'Below $100M' end) as 'Rev_category'

	from Book1
	where Gender != 'NULL' and Director_ID !='#N/A'
	group by Director_ID,Industry_Sector,Gender
	having AVG(Revenue) is not null
	order by Director_ID,Industry_Sector


	select 
	Company_Name,
	Director_ID,
	avg(Revenue) as 'avg_revenue'
	from Book1
	group by Company_Name,Director_ID
	order by Company_Name

	
	select distinct Director_ID,FY_Data,Revenue
	from Book1
	order by Director_ID 

	select * from Book1 where Director_ID='D009785'


	select distinct Revenue from book1



	select Director_ID,avg(Revenue) from Book1
	group by Director_ID

	select company_name,avg(Revenue) from Book1
	group by company_name
	order by avg(Revenue) desc


	select * from Book1 where Company_Name='C02849'

