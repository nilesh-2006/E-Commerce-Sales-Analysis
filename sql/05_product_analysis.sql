-- ============================================
-- Project : E-Commerce Sales Analysis
-- File    : 05_product_analysis.sql
-- Purpose : Product Analysis using SQL
-- ============================================

USE ecommerce;



-- 1 which products generated the highest sales ? (Top 10)
SELECT 
	product_id,
    product_name,
    ROUND(SUM(sales), 2) AS Total_Sales
FROM orders
GROUP BY 
	product_id,
    product_name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 2.  which products generated the highest profit ? (Top 10)
SELECT
    product_id,
    product_name,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM orders
GROUP BY
    product_id,
    product_name
ORDER BY Total_Profit DESC
LIMIT 10;

-- 3. which products generated the highest losses? (Top 10)
SELECT
    product_id,
    product_name,
    ROUND(SUM(profit), 2) AS Total_Loss
FROM orders
GROUP BY
    product_id,
    product_name
HAVING SUM(profit) < 0
ORDER BY Total_Loss ASC
LIMIT 10;

-- 4. which products were ordered the most ? (Top 10 by Quantity)
SELECT 
	product_id,
    product_name,
    SUM(quantity) AS Total_Quantity
FROM orders
GROUP BY 
	product_id, 
    product_name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 5. Which sub-category generated the highest average sales ?
SELECT
	sub_category,
    ROUND(AVG(sales), 2) AS Average_Sales
FROM orders
GROUP BY sub_category
ORDER BY Average_Sales DESC;

-- 6. Which sub-category generated the highest average PROFIT ?
SELECT
	sub_category,
    ROUND(AVG(profit), 2) AS Average_Profit
FROM orders
GROUP BY sub_category
ORDER BY Average_Profit DESC;

-- 7. What is the distribution of product sales?

SELECT
    CASE
        WHEN sales < 100 THEN '0 - 99'
        WHEN sales BETWEEN 100 AND 499 THEN '100 - 499'
        WHEN sales BETWEEN 500 AND 999 THEN '500 - 999'
        ELSE '1000+'
    END AS Sales_Range,

    COUNT(*) AS Total_Products

FROM orders

GROUP BY Sales_Range

ORDER BY
CASE
    WHEN Sales_Range = '0 - 99' THEN 1
    WHEN Sales_Range = '100 - 499' THEN 2
    WHEN Sales_Range = '500 - 999' THEN 3
    ELSE 4
END;

-- 8. What is the relationship between product sales and profit?
SELECT
    product_id,
    product_name,
    ROUND(SUM(sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM orders
GROUP BY
    product_id,
    product_name
ORDER BY Total_Sales DESC;