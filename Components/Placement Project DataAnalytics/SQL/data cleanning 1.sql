
--with cte
--as
--(
--select distinct Product_ID as 'p_id',Product_Name from cmncmn
--group by Product_ID,Product_Name
--)
--select p_id,COUNT(p_id) from cte
--group by p_id
--having COUNT(p_id)>1



--select  Product_ID,Product_Name,Sub_Category from cmncmn where Product_ID='FUR-FU-10004270'
--select   top 1 Product_ID from cmncmn where Product_ID like 'FUR-FU-%' order by Product_ID desc
--select  Product_ID,Product_Name,Sub_Category from cmncmn where Product_ID='FUR-FU-10004977'

----update cmncmn set Product_ID='FUR-FU-10004977' where Product_ID='FUR-FU-10004270' and Product_Name='Eldon Image Series Desk Accessories, Burgundy'



------------------------------------------------------------------------------------------------------------------------------------------------------------

declare @old_id nvarchar(30),@new_id nvarchar(30),@p_name nvarchar(200)
with cte
as
(
select distinct Product_ID as 'p_id',Product_Name from cmncmn
group by Product_ID,Product_Name
)
(select top 1 @old_id= p_id from cte
group by p_id
having COUNT(p_id)>1
)

select   top 1 @p_name=Product_Name from cmncmn where Product_ID =@old_id


set @new_id=(select
concat(SUBSTRING(@old_id,1,7),
(cast(SUBSTRING(@old_id,8,LEN(@old_id)) as int)+1)
))
select @old_id,@new_id,@p_name

select  Product_ID,Product_Name,Sub_Category from cmncmn where Product_ID=@new_id
select * from cmncmn where Product_ID=@old_id and Product_Name=@p_name

if not exists(select  Product_ID,Product_Name,Sub_Category from cmncmn where Product_ID=@new_id)
begin
select('asdasd')
update cmncmn set Product_ID=@new_id where Product_ID=@old_id and Product_Name=@p_name
end
