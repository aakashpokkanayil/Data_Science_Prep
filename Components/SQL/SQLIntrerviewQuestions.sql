
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

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- In this MySQL challenge, your query should determine the company's hierarchical structure based on the Position and ReportsTo columns.
-- The output should include the Position of the individual, their FirstName and LastName, and the Position of the person they report to.
-- Exclude entries where ReportsTo is null.
-- The result should be ordered by the Position of the person they report to and then by the individual's Position in ascending alphabetical order.
-- The expected columns in the output are: Position, FirstName, LastName, and ReportsToPosition.

--CREATE TABLE Employees (
--    EmployeeID INT PRIMARY KEY,
--    FirstName NVARCHAR(50),
--    LastName NVARCHAR(50),
--    Position NVARCHAR(100),
--    ReportsTo INT
--);


--INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, ReportsTo) VALUES
--(1, 'John', 'Doe', 'CEO', NULL),
--(2, 'Jane', 'Smith', 'CFO', 1),
--(3, 'Emily', 'Jones', 'CTO', 1),
--(4, 'Michael', 'Brown', 'VP of Sales', 2),
--(5, 'Sarah', 'Davis', 'VP of Marketing', 2),
--(6, 'James', 'Wilson', 'Sales Manager', 4),
--(7, 'Jessica', 'Garcia', 'Marketing Manager', 5),
--(8, 'William', 'Martinez', 'Lead Developer', 3),
--(9, 'David', 'Anderson', 'Senior Developer', 8),
--(10, 'Linda', 'Thomas', 'Product Manager', 3);


select
Position,
FirstName,
LastName,
ReportsTo as ReportsToPosition
from Employees
where reportsto is not null
order by reportsto,position











