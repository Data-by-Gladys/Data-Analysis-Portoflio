-- Database for assignment
CREATE database Customersorder;

-- Retrieving data in customer table
SELECT TOP (1000) [id]
      ,[first_name]
      ,[country]
      ,[score]
  FROM dbo.customers;

--Retriving data in orders table
SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_date]
      ,[sales]
  FROM dbo.orders;

--Assigment questions and solutions
--1. Retrieve the first name, country, and sales amount for all customers who have placed an order.
SELECT c.first_name, c.country, o.sales
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
ORDER BY o.sales DESC;

--2. Find the total sales made by each customer, showing first_name and total sales.
SELECT c.first_name, SUM(o.sales) AS Total_Sales
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
GROUP BY c.first_name
ORDER BY Total_Sales DESC;

--3. List customers from Germany along with their order dates and sales values.
SELECT c.first_name, c.country, o.order_date, o.sales
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
WHERE c.country ='Germany'
ORDER BY o.sales DESC;

--4. Calculate the average sales amount per country.
SELECT c.country, AVG(o.sales) AS AVG_Sales
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
GROUP BY c.country
ORDER BY AVG_Sales DESC;

--5. Find customers whose score is greater than 500 and who have made at least one order.
SELECT *
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
WHERE c.score >500
ORDER BY c.score DESC;

--6. Display all customers ordered by sales amount in descending order.
SELECT c.first_name, o.sales 
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
ORDER BY o.sales  DESC;

--7. What is the average sales value per order?
SELECT order_date, AVG(sales) AS AVG_Sales
FROM dbo.orders 
GROUP BY order_date
ORDER BY AVG_Sales DESC;

--8. Which customers have generated more than 20 total sales?
SELECT c.first_name, c.country, SUM(o.sales) AS Total_Sales 
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
GROUP BY c.first_name, c.country
HAVING SUM(o.sales) >20
ORDER BY Total_Sales DESC;

--9. Show customer name, country, order date, and sales amount for all orders.
SELECT c.first_name AS customer_name, c.country, o.order_date, SUM(o.sales) AS Total_Sales 
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
GROUP BY c.first_name, c.country, o.order_date
ORDER BY Total_Sales DESC;

--10. Which customers placed orders in the first half of 2021 (Jan–Jun)?
SELECT DISTINCT(c.id), c.first_name AS customer_name, c.country, o.order_date, o.sales AS Total_Sales 
FROM dbo.customers AS c
JOIN dbo.orders AS o
ON c.id = o.customer_id
WHERE o.order_date BETWEEN '2021-01-01' AND '2021-06-01';