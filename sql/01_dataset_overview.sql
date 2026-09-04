-- ============================================
-- Project: E-Commerce Sales Analysis
-- File: 01_dataset_overview.sql
-- Purpose: Understand the dataset using SQL
-- Author: Nilesh
-- ============================================

USE ecommerce;


-- 1. Total Number of orders
-- How many orders are there in the database?
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- 2. Total Sales
-- what is the total sales amount?
SELECT SUM(sales) AS Total_Sales
From orders;

-- 3. Total Profit
-- what is the total profit?
SELECT SUM(profit) AS Total_Profit
FROM orders;

-- 4. Average Sales
-- what is the average sales per order?
SELECT AVG(sales) AS Average_Sales
FROM orders;

-- 5. Average Profit
-- what is the average profit per order?
SELECT AVG(profit) AS Average_Profit
FROM orders;

-- 6. Total Customers
-- How many unique customers are there?
SELECT COUNT(DISTINCT customer_name) AS Total_customers
FROM orders;

-- 7. Total Products

SELECT COUNT(DISTINCT product_name) AS Total_Products
FROM orders;

-- 8. Total Categories
SELECT COUNT(DISTINCT category) AS Total_Categories
FROM orders;

-- 9. Total Sub Categories
SELECT COUNT(DISTINCT sub_category) AS Total_SubCategories
FROM orders;

-- 10. Total Regions
SELECT COUNT(DISTINCT region) AS Total_Regions
FROM orders;

-- 11. Total States
SELECT COUNT(DISTINCT state) AS Total_States
FROM orders;

-- 12. Minimum & Maximum Sales
SELECT 
MIN(sales) AS Minumum_Sales,
MAX(sales) AS Maximum_Sales
FROM orders;
