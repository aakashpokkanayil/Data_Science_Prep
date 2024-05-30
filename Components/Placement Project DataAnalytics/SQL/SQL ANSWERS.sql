-- Q1.	Find the top 5 customers with the highest lifetime value (LTV), 
	 -- where LTV is calculated as the sum of their profits divided by the number of years they have been customers.
		
		-- LTV shows that how valuable that customer is, profit / years they have been customers shows
		-- how much profit they give in period of time.
		-- it help us to identify valuable customers.
		-- it also help to identify purchasing power of customer as well.
		-- giving more offers to this customer will be great idea. 
		SELECT TOP 5 
			C.CUSTOMER_ID,
			C.CUSTOMER_NAME,
			SUM(PROFIT)/DATEDIFF(YEAR,MIN(ORDER_DATE),MAX(ORDER_DATE)) AS 'LIFETIME VALUE',
			SUM(PROFIT) AS 'TOTAL_PROFIT',
			MIN(ORDER_DATE) AS 'FIRST ORDER DATE' ,
			MAX(ORDER_DATE) AS 'LAST ORDER DATE' ,
			DATEDIFF(YEAR,MIN(ORDER_DATE),MAX(ORDER_DATE)) AS 'DIFFERENCE IN YEAR'
		FROM TBL_ORDERS O
		INNER JOIN TBL_CUSTOMER C
		ON O.CUSTOMER_ID=C.CUSTOMER_ID
		GROUP BY C.CUSTOMER_NAME,C.CUSTOMER_ID
        HAVING DATEDIFF(YEAR,MIN(ORDER_DATE),MAX(ORDER_DATE)) <> 0
		ORDER BY 'LIFETIME VALUE' DESC


		

		SELECT * FROM TBL_ORDERS WHERE CUSTOMER_ID='TC-20980' ORDER BY ORDER_DATE DESC


-- Q2.	Create a pivot table to show total sales by product category and sub-category.

		-- pivot table helps to summarize data effectively 
		-- here in row we have sub category and columns we have categories based on total sales by  category and sub-category
		-- here from pivot table we can say phones from technologies sales are higher than other  categories and sub categories, 
		-- followed by chairs in furniture categories
		-- we can identify demands in each category.like chairs in FURNITURE, Storage in OFFICE SUPPLIES and Phones in TECHNOLOGY

		-- we can provide combo offer like chair and tables will increases sales of tables too. also phones and Accessories etc.

		SELECT 
			SUB_CATEGORY,
			ISNULL([FURNITURE],0) as FURNITURE,
			ISNULL([OFFICE SUPPLIES],0) as [OFFICE SUPPLIES],
			ISNULL([TECHNOLOGY],0) as [TECHNOLOGY]
		FROM 
		(
		SELECT 
			CATEGORY,
			S.SUB_CATEGORY,
			SALES
		FROM TBL_ORDERS O
		INNER JOIN TBL_PRODUCT P ON O.PRODUCT_ID=P.PRODUCT_ID
		INNER JOIN TBL_SUBCATEGORY S ON P.SUB_CATEGORY=S.SUB_CATEGORY
		--GROUP BY CATEGORY,S.SUB_CATEGORY
		) AS SOURCETABLE
		PIVOT
		(
		SUM(SALES)
		FOR CATEGORY IN ([FURNITURE],[OFFICE SUPPLIES],[TECHNOLOGY])
		) AS PIVOTTABLE
		ORDER BY [FURNITURE] DESC,[OFFICE SUPPLIES] DESC,[TECHNOLOGY] DESC




-- Q3.	Find the customer who has made the maximum number of orders in each category:

		-- here we gets valueable customer who purchased more in each category, so we can give more offers to then as they are potential customers.

		WITH CTE 
		AS
		(
		SELECT 
			CATEGORY,
			CUSTOMER_ID,
			COUNT(ORDER_ID) AS 'ORDER_COUNT' ,
			RANK() OVER(PARTITION BY CATEGORY ORDER BY CATEGORY,COUNT(ORDER_ID) DESC) AS 'RANK'
		FROM TBL_ORDERS O
		INNER JOIN TBL_PRODUCT P ON O.PRODUCT_ID=P.PRODUCT_ID
		INNER JOIN TBL_SUBCATEGORY S ON P.SUB_CATEGORY=S.SUB_CATEGORY
		GROUP BY CUSTOMER_ID,CATEGORY
		--ORDER BY CATEGORY,'ORDER_COUNT' DESC
		)
		SELECT 
			CATEGORY,
			CU.CUSTOMER_ID,
			CU.CUSTOMER_NAME,
			ORDER_COUNT 
		FROM CTE C
		INNER JOIN TBL_CUSTOMER CU
		ON C.CUSTOMER_ID=CU.CUSTOMER_ID
		WHERE  [RANK]=1
		ORDER BY ORDER_COUNT DESC



		


-- Q4.	Find the top 3 products in each category based on their sales.
		
		-- 'HON 5400 Series Task Chairs for Big and Tall' in Furniture
		-- 'Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind' in Office Supplies
		-- 'Canon imageCLASS 2200 Advanced Copier' in 'Technology'
		-- are the demanded producting 
		-- it seems as sub_categories phones in technologies are topper but as demanded product 'Canon imageCLASS 2200 Advanced Copier' leads.(coz obviously phone are cheaper than copier )

		select * from tbl_orders where product_id='TEC-CO-10004722'
		select * from tbl_orders o inner join tbl_product p 
		on o.product_id=p.product_id
		where p.product_id like 'TEC-PH-%'


		WITH CTE 
		AS
		(
		SELECT 
			CATEGORY,
			P.PRODUCT_ID,
			SUM(SALES) AS 'TOTAL_SALES' ,
			ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY CATEGORY,SUM(SALES) DESC) AS 'RANK'
		FROM TBL_ORDERS O
		INNER JOIN TBL_PRODUCT P ON O.PRODUCT_ID=P.PRODUCT_ID
		INNER JOIN TBL_SUBCATEGORY S ON P.SUB_CATEGORY=S.SUB_CATEGORY
		GROUP BY P.PRODUCT_ID,CATEGORY
		--ORDER BY CATEGORY,'TOTAL_SALES' DESC
		)
		SELECT 
			c.CATEGORY,
			s.sub_category,
			P.PRODUCT_ID,
			P.PRODUCT_NAME,
			TOTAL_SALES 
		FROM CTE C
		INNER JOIN TBL_PRODUCT P
		ON C.PRODUCT_ID=P.PRODUCT_ID
		inner join tbl_subcategory s
		on p.sub_category=s.sub_category
		WHERE  [RANK] IN (1,2,3)
		ORDER BY CATEGORY,TOTAL_SALES DESC


-- Q5.	In the table Orders with columns OrderID, CustomerID, OrderDate, TotalAmount, and Status.
	 -- You need to create a stored procedure Get_Customer_Orders that takes a CustomerID as input and returns a table with the following columns,
	 -- you will need to create a function also that calculates the number of days between two dates.  
	 --	cols:
		-- OrderDate
		-- TotalAmount
		-- TotalOrders: The total number of orders made by the customer.
		-- AvgAmount: The average total amount of orders made by the customer.
		-- LastOrderDate: The date of the customer's most recent order.
		-- DaysSinceLastOrder: The number of days since the customer's most recent order.


		ALTER PROCEDURE GET_CUSTOMER_ORDERS @CUSTOMERID NVARCHAR(50)
		AS
		SELECT 
		ORDER_DATE,
		SUM(SALES) AS TOTALAMOUNT,
		COUNT(ORDER_ID) AS TOTALORDERS,
		AVG(SALES) AS AVGAMOUNT,
		(SELECT MAX(ORDER_DATE)  FROM TBL_ORDERS WHERE CUSTOMER_ID=@CUSTOMERID ) AS LASTORDERDATE,
		DBO.DATE_DIFF_BY_DAY(ORDER_DATE,(SELECT MAX(ORDER_DATE)  FROM TBL_ORDERS WHERE CUSTOMER_ID=@CUSTOMERID)) AS DAYSSINCELASTORDER
		FROM TBL_ORDERS 
		WHERE CUSTOMER_ID=@CUSTOMERID
		GROUP BY ORDER_DATE
		ORDER BY DAYSSINCELASTORDER DESC


		ALTER FUNCTION DATE_DIFF_BY_DAY (@STARTDATE DATE,@ENDDATE DATE)
		RETURNS INT
		AS
		BEGIN 
		RETURN DATEDIFF(DAY,@STARTDATE,@ENDDATE)
		END

		

		Get_Customer_Orders 'BH-11710'

		select * from tbl_customer where customer_id='BH-11710'


		-- this sp will provide a total over view of a customer.
		-- total amount , avg amount,total orders of each order day.
		-- we can also identify how often customer purchases. so we can identify frequent customers.


	create table sal
	(
	name varchar(50),
	salary int
	)

	insert into sal
	values
	('gg',1500008),
	('hh',1000007)

	with cte
	as
	(
	select name,
	salary,
	rank() over(order by salary desc) as rnk
	from sal
	--order by rnk
	)
	select * from cte where rnk=2

