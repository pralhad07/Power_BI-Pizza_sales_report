use Pizza_DB
select * from pizza_sales

SELECT SUM(total_price) Total_Revenue from pizza_sales

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) Avg_Order_Value from pizza_sales

SELECT SUM(quantity) Total_Pizza_Sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) Total_Orders FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) Avg_Pizza_Per_Order 
FROM pizza_sales

SELECT pizza_category,SUM(quantity) Total_Quantity_by_Category FROM pizza_sales GROUP BY pizza_category

SELECT pizza_size, SUM(quantity) Total_Quanity_by_Size	FROM pizza_sales GROUP BY pizza_size ORDER BY Total_Quanity_by_Size DESC

------------------------------------------Trends

SELECT DATENAME(DW, order_date) DAY_, COUNT(DISTINCT order_id) Orders_Count FROM pizza_sales GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) Month, COUNT(DISTINCT order_id) Orders_Count FROM pizza_sales GROUP BY DATENAME(MONTH, order_date)


SELECT pizza_category, SUM(total_price) Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) PCT FROM pizza_sales 
GROUP BY pizza_category

SELECT pizza_category, SUM(total_price) Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS decimal(10,2)) PCT 
FROM pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category



SELECT pizza_size, CAST(SUM(total_price) AS decimal(10,2)) Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) PCT 
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC

----------------------------------------------Top's
SELECT TOP 5 pizza_name_id, CAST(SUM(total_price)as decimal(10,2)) Total_Sales FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_Sales DESC

SELECT TOP 5 pizza_name_id, SUM(total_price) Total_Sales FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_Sales 

SELECT TOP 5 pizza_name_id, COUNT(quantity) Total_Quantity FROM pizza_sales
GROUP BY pizza_name_id
ORDER BY Total_Quantity DESC


SELECT TOP 5 pizza_name_id, COUNT(quantity) Total_Quantity FROM pizza_sales
GROUP BY pizza_name_id ORDER BY Total_Quantity