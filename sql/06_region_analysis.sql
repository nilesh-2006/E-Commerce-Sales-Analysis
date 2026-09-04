-- ============================================
-- Project : E-Commerce Sales Analysis
-- File    : 06_region_analysis.sql
-- Purpose : Region Analysis using SQL
-- ============================================

USE ecommerce;

-- 1. WHICH region generated  the highest sales ?

SELECT 
	region,
    ROUND(SUM(sales), 2) AS Total_Sales
FROM orders
GROUP BY region 
ORDER BY Total_Sales DESC;

-- 2. Which region generated the highest profit ?

SELECT 
	region,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM orders
GROUP BY region
ORDER BY Total_Profit DESC;

-- 3. which region generated the highest losses ?

SELECT
    region,
    ROUND(SUM(profit), 2) AS Total_Loss
FROM orders
GROUP BY region
ORDER BY Total_Loss ASC;

-- 4. which states generated the highest sales ? (Top 10)
SELECT 
	state,
    ROUND(SUM(sales), 2) AS Total_Sales
FROM orders
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;

-- 5. which states generated the highest profit ? (Top 10)
SELECT 
	state,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM orders
GROUP BY state
ORDER BY Total_Profit DESC
LIMIT 10;

-- 6. which states generated the highest losses ?
SELECT 
    State,
    ROUND(SUM(Profit), 2) AS Total_Loss
FROM orders
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY Total_Loss ASC;

-- 7. What is the distribution of regional sales ?
SELECT 
    region,
    SUM(sales) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 / (SELECT SUM(sales) FROM orders),
        2
    ) AS sales_percentage
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- 8. What is the relationship between sales and profit across regions ?
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
    
FROM orders
GROUP BY region
ORDER BY total_sales;

