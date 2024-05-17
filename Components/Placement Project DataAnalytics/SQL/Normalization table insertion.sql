
-- Table insertion

--insert into tbl_subcategory
--select distinct sub_category,Category from cmncmn

select * from tbl_subcategory



--insert into tbl_product
--select distinct Product_ID,Product_Name,Sub_Category from cmncmn

select * from tbl_product


--insert into tbl_address(postal_code,region,state,city)
--select distinct Postal_Code,Region,State,City from cmncmn

select distinct Postal_Code,Region,State,City from cmncmn where Postal_Code='92024' --92110 

--update cmncmn set Postal_Code='92110' where Postal_Code='92024' and City='San Diego'

--update tbl_address set country_code='USA'

select * from tbl_address

--insert into tbl_customer
--select distinct Customer_ID, Customer_Name,Segment from cmncmn

select * from tbl_customer

--insert into tbl_orders(Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Postal_Code,Product_ID,Sales,Quantity,Discount,Profit)
--select distinct Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Postal_Code,Product_ID,Sales,Quantity,Discount,Profit from cmncmn

select * from tbl_orders






