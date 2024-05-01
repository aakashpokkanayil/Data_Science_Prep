
--Q1
 select * from R where a in (select S.a from S) 

 select R.* from R,(select distinct a from S) as S1
 where R.a=S1.a

 -- Ans:Above both querries give same result. first one uses subquery and second querry uses cross join + where of common elements(same as inner join) 

 --------------------------------------------------------------------------------------------------------------------------------------------------------------

 --Q2.You have a table named "Orders" with columns: OrderID, CustomerID, OrderDate, and TotalAmount.
	--You need to retrieve the customer IDs of those customers who have placed more than one order on the same day. Which SQL query would you use?

--CREATE TABLE Orders (
--    OrderID INT,
--    CustomerID INT,
--    OrderDate DATE,
--    TotalAmount DECIMAL
--);


--INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
--(1, 1001, '2024-01-01', 250.00),
--(2, 1002, '2024-01-01', 190.50),
--(3, 1001, '2024-01-01', 300.00), -- Same customer (1001), same day
--(4, 1003, '2024-02-15', 450.00),
--(5, 1002, '2024-02-15', 220.00),
--(6, 1003, '2024-03-20', 330.00),
--(7, 1002, '2024-01-01', 185.00), -- Same customer (1002), same day
--(8, 1001, '2024-03-20', 720.00),
--(9, 1004, '2024-01-01', 100.00);

select CustomerID,orderdate from orders


select CustomerID,orderdate,count(orderdate) from orders
group by customerid,orderdate
having count(orderdate) >1

---------------------------------------------------------------------------------------------------------------------------------
SELECT 1 WHERE NULL = NULL -- Because the NULL value cannot be equal or unequal to any value, 
						   -- you cannot perform any comparison on this value by using operators such as '=' or '<>'.

SELECT 1 WHERE 1 = 1 -- this is possible

select 1 where null is null  --also with is null this is possible

SELECT NULL + '1' 

SELECT NULL + 5

SELECT COUNT(*) + COUNT(*)  -- returns 2

SELECT MAX(1+2*3)

SELECT MAX(1,3,4) -- return error

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q3.With SQL, how do you select all the records from a table named "Customers" where the "Last_Name" is alphabetically
   --between (and including) "Brooks" and "Gray"?


   --select * from customer where last_name between 'Brooks' and 'Gray'














