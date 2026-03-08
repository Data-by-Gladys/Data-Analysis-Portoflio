	--AXIA AFRICA SQL PROJECT ANALYSIS

--Creating a database which would hold my imported csv file
CREATE database Sales_records;

--EDA QUESTIONS
--Dataset importation and records retrival
-- 1. Retrieve the first 10 records from the dataset to understand its structure
Select top 10*
from dbo.sales_data;

-- 2. What is the total sales and total profit generated across all orders?
Select Sum(Sales) AS Total_Sales, Sum(Profit) As Total_Profit
From dbo.sales_data;

-- 3. Which region has the highest total sales?
Select Region, Sum(Sales) AS Total_Sales
From dbo.sales_data
Group by Region;

-- 4.  What is the total sales and total profit by product category, ordered by highest sales.
Select Category, Sum(Sales) AS Total_Sales, Sum(Profit) As Total_Profit
From dbo.sales_data
Group By Category
Order By Total_Sales Desc;

-- 5. What is the average sales per order for each customer segment?
Select Segment, Count(Distinct Order_ID) As Orders, Avg(Sales) AS Average_Sales
From dbo.sales_data
Group By Segment;

-- 6. Retrieve orders where sales are greater than 1,000, sorted by sales in descending order.
Select Order_ID, Sales
From dbo.sales_data
where Sales > 1000
Order By Sales Desc;

-- 7. Identify the top 5 sub-categories by total profit. Concepts: Groupby, Orderby, Limit
Select Top 5 Sub_Category , Sum(Profit) As Total_Profit
From dbo.sales_data
Group By Sub_Category
Order By Total_Profit Desc;

-- 8. Which product categories have total profit greater than 10,000? Concepts: Groupby, Having
Select Category , Sum(Profit) As Total_Profit
From dbo.sales_data
Group By Category
Having Sum(Profit) > 10000;

-- 9. Which Sub-Categories are actually losing money, and how many unique orders contributed to those losses? 
Select count(Distinct Order_ID) As Orders, Sub_Category , Sum(Profit) As Total_Profit
From dbo.sales_data
Group By Sub_Category
Having Sum(Profit) < 0
Order By Total_Profit Desc;

-- 10. For each Category, what is the Profit Margin, and which category has the highest margin?
Select Category , Sum(Profit)/Sum(Sales) As Profit_Margin
From dbo.sales_data
Group By Category
Order By Profit_Margin Desc;

	--KEY FINDINGS & BUSINESS INSIGHTS
--The analysis calculated the company’s total sales and total profit to understand overall performance. By grouping sales by region, it identified the areas generating the most revenue. It also highlighted the top five most profitable sub-categories and major categories that earned over $10,000 in profit, such as Technology and Office Supplies. High-value orders above $1,000 were identified, showing their strong contribution to revenue. The analysis further showed that some products drive high sales but lower profit, while others generate strong profit, and that a few key sub-categories contribute most of the profit. It also revealed that customer segments spend differently and that the presence of many large orders suggests strong participation from business or high-value buyers. THe analysis also pointed out sub-categories were the company was losing money and the orders that contirbuted to these losses and as well as category with highest margin.

	--CONCLUSION
--The analysis shows that the company should review sub-categories that are making losses to understand possible issues with pricing, costs, or discounts. Regions with strong sales performance could be good areas for further growth and investment. Categories like Technology and Office Supplies should continue to receive attention because they contribute greatly to profit. Also, products with high sales but low profit should be examined to find out why they are not generating enough profit despite strong demand.