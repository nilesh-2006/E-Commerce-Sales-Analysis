-- ============================================
-- Project : E-Commerce Sales Analysis
-- File    : 03_profit_analysis.sql
-- Purpose : Profit Analysis using SQL
-- ============================================

USE ecommerce;

-- == Profit Analysis == 

-- 1. How does profit change month by month ? 

SELECT 
	month,
    month_name,
    SUM(profit) AS Total_Profit
FROM orders
GROUP BY month, month_name
ORDER BY month;

-- 2. Which year generated the highest profit?

SELECT 
	year,
    SUM(profit) AS Total_Profit
FROM orders
GROUP BY year
ORDER BY Total_Profit DESC
LIMIT 1;

-- 3. Which category generated the highest profit?

SELECT 
	 category,
     SUM(profit) AS Total_Profit
FROM orders
GROUP BY category
ORDER BY Total_Profit DESC;

-- 4. Which sub-category generated the highest profit?

SELECT 
	sub_category,
    SUM(profit) AS Total_Profit
FROM orders
GROUP BY sub_category
ORDER BY Total_Profit DESC;

-- 5. Which ship mode generated the highest profit? 
SELECT 
	ship_mode,
    SUM(profit) AS Total_Profit
FROM orders
GROUP BY ship_mode
ORDER BY Total_Profit DESC;

-- 6. Which month generated the highest average profit?
SELECT 
	month, month_name,
    ROUND(AVG(profit),2) AS Average_Profit
FROM orders
GROUP BY month, month_name
ORDER BY Average_Profit DESC
LIMIT 1;

-- 7. What is the distribution of profit values?
SELECT 
	CASE
		WHEN profit < 0 THEN "Loss (< 0)"
        WHEN profit >= 0 AND profit < 100 THEN "0 - 99"
        WHEN profit >= 100 AND profit < 500 THEN "100 - 499"
        WHEN profit >= 500 AND profit < 1000 THEN "500 - 999"
        ELSE "1000+"
	END AS Profit_Range,
    
    COUNT(*) AS Number_of_Orders

FROM orders

GROUP BY Profit_Range

ORDER BY 
CASE
	WHEN Profit_Range = "Loss (< 0)" THEN 1
    WHEN Profit_Range = "0 - 99" THEN 2
    WHEN Profit_Range = "100 - 499" THEN 3
    WHEN Profit_Range = "500 - 999" THEN 4
    ELSE 5

END;

-- 8. Which orders generated a loss? (Profit < 0)
SELECT
    profit_status AS Profit_Status,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY profit_status
ORDER BY profit_status;

-- # 9. What percentage of total profit comes from each category?

SELECT 
	category,
    ROUND(SUM(profit),2) AS Total_Profit,
    ROUND(
		(SUM(profit) / (SELECT SUM(profit) FROM orders)) * 100,
        2
	) AS Profit_Percentage

FROM orders
GROUP BY category
ORDER BY Profit_Percentage;

-- 10. How does discount affect profit ?
SELECT
	discount,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(profit), 2) AS Average_Profit,
    ROUND(SUM(profit), 2) AS Total_Profit

FROM orders
GROUP BY discount
ORDER BY discount;