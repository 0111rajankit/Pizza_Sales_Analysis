use pizza_place_sales;
#Recommended Analysis

#Q1. How many customers do we have each day? Are there any peak hours?
# How many customers do we have each day ?

SELECT * FROM orders;

SELECT Round(AVG(counts),0) as numbers_of_customers_each_day
FROM (
SELECT date, COUNT(DISTINCT order_id) AS counts
FROM orders
GROUP BY date
)subquery;

#Are there any peak hours?

SELECT
  hour(time) as hour,
  count(*) as num_of_customers
FROM orders
GROUP BY hour(time)
ORDER BY hour;

#Q2. How many pizzas are typically in order? Do we have any bestsellers?
#Average No. of Pizza in an Order

SELECT round(Avg(order_count),0) AS average_order_count
FROM (
    SELECT order_id, COUNT(order_id) AS order_count
    FROM order_details
    GROUP BY order_id
) subquery;

#Do we have any bestsellers?

SELECT pizza_id, Count(order_id) AS total_sold
FROM order_details
GROUP BY pizza_id
ORDER BY total_sold DESC;

# Q3. How much money did we make this year? 

Select SUM(price) AS Total_profit
FROM
(
Select order_details.pizza_id, pizzas.price
FROM
order_details
LEFT JOIN 
pizzas
ON
order_details.pizza_id=pizzas.pizza_id 
) AS pizza_prices;

#Q4. Are there any pizzas we should take off the menu, or any promotions we could leverage

SELECT pizza_id, Count(order_id) AS total_sold
FROM order_details
GROUP BY pizza_id
ORDER BY total_sold;

#More Insights

#Total No. of Pizza Sold

Select Count(order_details_id) AS Total_No_Of_Pizza_Sold
from order_details;


#Total No. of Order Plcaed 

Select count(Order_id) AS Total_No_Of_Order_Placed
from orders;

#Average Order Value Per Customer

Select avg(total_price) AS average_order_value_per_customer
FROM (
SELECT order_details.order_id, SUM(pizzas.price) AS total_price
FROM order_details
LEFT JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY order_details.order_id )
as pizza_prices;

#Sum of Sales as Per Pizza Category Size

SELECT DISTINCT(pizzas.size), SUM(pizzas.price) AS sum_of_amount
FROM 
order_details
LEFT JOIN 
pizzas 
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size