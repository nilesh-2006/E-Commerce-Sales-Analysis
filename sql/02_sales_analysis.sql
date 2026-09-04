-- ============================================
-- Project : E-Commerce Sales Analysis
-- File    : 02_sales_analysis.sql
-- Purpose : Sales Analysis using SQL
-- ============================================

USE ecommerce;

-- 1. Which year generated the highest sales?
SELECT year, SUM(sales) AS Total_Sales
FROM orders
GROUP BY year
ORDER BY Total_Sales DESC
LIMIT 1;

-- 2. How have sales changed month by month?
SELECT 
	month,
    month_name,
    SUM(sales) AS Total_Sales
FROM orders
GROUP BY month, month_name
ORDER BY month;

-- 3. which category generate the highest sales?
SELECT 
	category,
    SUM(sales) AS Category_Sales
FROM orders
GROUP BY category
ORDER BY Category_Sales DESC
LIMIT 1;

-- 4. Which sub-category generated the highest sales?
SELECT 
	sub_category,
    SUM(sales) AS Total_Sales
FROM orders
GROUP BY sub_category
ORDER BY Total_Sales DESC
LIMIT 1;

-- 5. Which customer segment generated the highest sales?
SELECT 
	segment,
    SUM(sales) AS Total_Sales
FROM orders
GROUP BY segment
ORDER BY Total_Sales DESC
LIMIT 1;

-- 6. Which ship mode generated the highest sales?
SELECT 
	ship_mode,
    SUM(sales) AS Total_Sales
FROM orders
GROUP BY ship_mode
ORDER BY Total_Sales DESC
LIMIT 1;

-- 7. What is the distribution of sales values?
SELECT 
	CASE
		WHEN sales < 100 THEN "0 - 99"
        WHEN sales >= 100 AND sales < 500 THEN "100 - 499"
        WHEN sales >= 500 AND sales < 1000 THEN "500 - 999"
        WHEN sales >= 1000 AND sales < 5000 THEN "1000 - 4999"
		ELSE "5000+"
	END AS Sales_Range,
    
    COUNT(*) AS Number_of_Orders

FROM orders

GROUP BY Sales_Range

ORDER BY 
CASE 
	WHEN Sales_Range = "0 - 99"  THEN 1
    WHEN Sales_Range = "100 - 499"  THEN 2
    WHEN Sales_Range = "500 - 999"  THEN 3
    WHEN Sales_Range = "1000 - 4999"  THEN 4
    ELSE 5
END;

-- 8. what percentage of total sales comes from each category? give the query 

SELECT 
	category,
    SUM(sales) AS Total_Sales,
    ROUND(
		(SUM(sales) / (SELECT SUM(sales) FROM orders)) * 100, 2
	) AS Sales_Percentage

FROM orders
GROUP BY category
ORDER BY Sales_Percentage DESC;
    
-- 9. Which month generated the highest average sales
SELECT 
	month, 
    month_name,
    ROUND(AVG(sales),2) AS Average_Sales
FROM orders
GROUP BY month, month_name
ORDER BY Average_Sales DESC
LIMIT 1;

-- 10. Which day of the week generated the highest sales 
SELECT 
	day_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM orders
GROUP BY day_name
ORDER BY Total_Sales DESC;
