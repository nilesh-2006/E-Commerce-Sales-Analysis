-- ============================================
-- Project : E-Commerce Sales Analysis
-- File    : 04_customer_analysis.sql
-- Purpose : Customer Analysis using SQL
-- ============================================

USE ecommerce;


-- 1. Which customers generated the highest sales? (Top 10)

SELECT 
	customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS Total_Sales
FROM orders
GROUP BY 
	customer_id, 
    customer_name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 2. Which customers generated the highest profit? (Top 10)
SELECT 
	customer_id,
    customer_name,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM orders
GROUP BY 
	customer_id, 
    customer_name
ORDER BY Total_Profit DESC
LIMIT 10;
	
-- -- 3. Which customers generated the highest Loss? (Top 10)

SELECT 
	customer_id,
    customer_name,
    ROUND(SUM(profit), 2) AS Total_Loss
FROM orders
WHERE profit < 0
GROUP BY 
	customer_id, 
    customer_name
ORDER BY Total_Loss ASC
LIMIT 10;

-- 4.  Which customers generated the highest number of orders? (Top 10)
SELECT 
	customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM orders
GROUP BY
	customer_id,
    customer_name
ORDER BY Total_Orders
LIMIT 10;

-- 5. Which region has the highest number of customers?
SELECT
	region,
    COUNT(DISTINCT customer_id) AS Total_Customers
FROM orders
GROUP BY region
ORDER BY Total_Customers DESC;

-- 6. Which customer segment generate the highest profite ?
SELECT 
	segment,
    ROUND(SUM(profit),2) AS Total_Profit
FROM orders
GROUP BY segment
ORDER BY Total_Profit DESC;

-- 7. What percentage of customers belong to each segment ?
SELECT 	
	segment,
    COUNT(DISTINCT customer_id) AS Total_Customers,
    ROUND(
		COUNT(DISTINCT customer_id) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM orders),
		2
	) AS Total_Percentage
    
FROM orders
GROUP BY segment
ORDER BY Total_Customers DESC;

-- 8. What is the distribution of customer sales ? 
SELECT 
	CASE
		WHEN Total_Sales < 1000 THEN '0 - 999'
        WHEN Total_Sales BETWEEN 1000 AND 4999 THEN '1000 - 4999'
		WHEN Total_Sales BETWEEN 5000 AND 9999 THEN '5000 - 9999'
        ELSE '10000+'
	END AS Sales_Range,
    
    COUNT(*) AS Total_Customers

FROM
(	
	SELECT 
		customer_id,
        customer_name,
        SUM(sales) AS Total_Sales
	FROM orders
    GROUP BY customer_id, customer_name
) AS customer_sales

GROUP BY Sales_Range

ORDER BY 
CASE 
	WHEN Sales_Range = '0 - 999' THEN 1
    WHEN Sales_Range = '1000 - 4999' THEN 2
    WHEN Sales_Range = '5000 - 9999' THEN 3
    ELSE 4
END;

-- 9. What is the relationship between customer sales and profit ? 
SELECT 
	customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit) ,2) AS Total_Profit
FROM orders
GROUP BY
	customer_id,
    customer_name
ORDER BY Total_Sales DESC;


-- 10. which states have the highest number of customers ?
SELECT 
	state,
    COUNT(DISTINCT customer_id) AS Total_Customers 
FROM orders
GROUP BY state
ORDER BY Total_Customers  DESC;


        
		
