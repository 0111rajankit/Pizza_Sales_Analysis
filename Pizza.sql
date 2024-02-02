Use [Pizza DB];

SELECT * FROM pizza;


-- A. KPI Requirements
-- 1. Total Revenue

SELECT SUM(price) AS Total_Revenue
FROM pizza;


-- 2. Average Order Value

SELECT SUM(price)/ COUNT (DISTINCT (Order_id)) AS Average_Order_value
FROM pizza;


-- 3. Total Pizza Sold 

SELECT SUM(quantity) AS Total_Pizza_Sold 
FROM Pizza;

-- 4. Total Orders

SELECT COUNT(DISTINCT (Order_id)) AS Total_Orders_Placed
FROM Pizza;


-- 5. Average Pizzas Per Order

SELECT SUM(quantity)/ COUNT(DISTINCT(Order_id) )
FROM pizza;

-- B. Daily Trends/Weekly for Total Orders thorugh out the year

SELECT Weeks_Name, COUNT(DISTINCT Order_id) AS total_orders
FROM pizza 
GROUP BY Weeks_Name
ORDER BY total_orders desc;;


-- C. Monthly Trend for Orders for Total Orders thorugh out the year

SELECT Months, COUNT(DISTINCT Order_id) AS total_orders
FROM pizza
GROUP BY Months
ORDER BY total_orders desc;


-- D. % of Sales by Pizza Category

SELECT category, SUM(price) AS total_price, 
SUM(price)*100/ (SELECT SUM(price) FROM pizza) AS Percentage_Contribution_by_pizza_category
FROM pizza
GROUP BY category
ORDER BY total_price DESC;


-- E .% of Sales by Pizza Size

SELECT size, SUM(price) AS total_price,
SUM(price)*100 / (SELECT SUM(price) FROM pizza) AS Percentage_by_pizza_size
FROM pizza
GROUP BY size
ORDER BY Percentage_by_pizza_size DESC;


-- F. Total Pizzas Sold by Pizza Category

SELECT category, SUM(quantity) AS total_pizza_sold
FROM pizza
GROUP BY category
ORDER BY SUM(quantity) DESC;


-- G. Top 5 Pizza's by Revenue

SELECT TOP 5 name, SUM(price) AS Revenue
FROM pizza
GROUP BY name
ORDER BY Revenue DESC;

-- H. Bottom 5 Pizza's by Revenue

SELECT TOP 5 name, SUM(price) AS Revenue
FROM pizza
GROUP BY name
ORDER BY Revenue ASC;

--I. Top 5 Pizza's by Quantity

SELECT TOP 5 name, SUM(quantity) AS total_quantity_sold
FROM pizza
GROUP BY name
ORDER BY total_quantity_sold DESC;

-- J. Bottom 5 Pizza's by Quantity

SELECT TOP 5 name, SUM(quantity) AS total_quantity_sold
FROM pizza
GROUP BY name
ORDER BY total_quantity_sold ASC;

--K. Top 5 Pizza's by Total Orders

SELECT TOP 5 name, COUNT(DISTINCT Order_id) AS total_Orders
FROM pizza
GROUP BY name
ORDER BY total_Orders DESC;


---L. Bottom 5 Pizza's by Total Orders

SELECT TOP 5 name, COUNT(DISTINCT Order_id) AS total_Orders
FROM pizza
GROUP BY name
ORDER BY total_Orders ASC;


select datepart(hh,time) as time_hours, count(distinct order_id) as total_orders
from pizza
group by datepart(hh,time)
order by time_hours



