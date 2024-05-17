-- Table creation

--create table tbl_orders
--(
--	order_id nvarchar(20),
--	order_date date,
--	ship_date date,
--	ship_mode varchar(20),
--	customer_id nvarchar(20) foreign key references tbl_customer(customer_id),
--	product_id nvarchar(20) foreign key references tbl_product(product_id),
--	sales float,
--	quantity int,
--	discount float,
--	profit float
--)

--create table tbl_customer
--(
--	customer_id nvarchar(20) primary key,
--	customer_name nvarchar(100),
--	segment varchar(20),
--	postal_code int foreign key references tbl_address(postal_code)
--)

--create table tbl_address
--(
--	postal_code int primary key,
--	region varchar(10),
--	state varchar(20),
--	city varchar(20),
--	country_code char(3)
--)

--create table tbl_product
--(
--	product_id nvarchar(20) primary key,
--	product_name nvarchar(max),
--	sub_category_id int foreign key references tbl_subcategory(sub_category_id)
--)

--create table tbl_subcategory
--(
--	sub_category varchar(50) primary key,
--	category varchar(50)
--)



--alter table tbl_product
--drop constraint FK__tbl_produ__sub_c__5EBF139D

--alter table tbl_product 
--drop column sub_category_id

--drop table tbl_subcategory

--alter table tbl_product
--add  sub_category varchar(50) foreign key references tbl_subcategory(sub_category)

--alter table tbl_orders
--add Row_ID int primary key

--alter table tbl_customer
--drop constraint FK__tbl_custo__posta__6383C8BA

--alter table tbl_customer 
--drop column postal_code

--alter table tbl_orders
--add  postal_code int foreign key references tbl_address(postal_code)