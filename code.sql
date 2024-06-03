## SQL QUERIES FOR THIS PROBLEM STATEMENT
  
#1) Total Revenue
SELECT SUM(total_price) as Total_Revenue
FROM pizza_sales

#2) Average Order Value
select sum(total_price)/count(distinct order_id) as Avg_ordervalue
from pizza_sales

#3) Total Pizza Sold
select sum(quantity) as pizza_sold
from pizza_sales

#4) Total Orders Placed
select count(distinct order_id) as total_orders_placed
from pizza_sales

#5) Average Pizza Per Order
select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizzaperorder
from pizza_sales

#6) Daily Trend For Total Order 
select DATENAME(DW, order_date) as Day_of_the_Week,count(distinct order_id) as total_order
from pizza_sales
group by  DATENAME(DW, order_date)

#7) Monthly Trend For Total Order 
select DATENAME(MONTH, order_date) as Monthly ,count(distinct order_id) as total_order
from pizza_sales
group by  DATENAME(MONTH, order_date)
order by total_order 

#8) Percentage Of Sales By Pizza Category By Month
select pizza_category, sum(total_price) as total_price,sum(total_price)*100/(select sum(total_price) from pizza_sales where MONTH(order_date)=1) as percentge_ofsale
from pizza_sales 
where MONTH(order_date)=1
group by  pizza_category

#9) Percentage Of Sales By Pizza Size By Quarter
select pizza_size, sum(total_price) as total_price,sum(total_price)*100/(select sum(total_price) from pizza_sales ) as percentge_ofsale
from pizza_sales 
where DATEPART(quarter, order_date)= 1
group by  pizza_size

#10) Top 5 Pizza Sales by Revenue
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_price
from dbo.pi
group by pizza_name
order by total_price desc

#11) Bottom 5 Pizza Sales by Revenue
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_price
from pizza_sales
group by pizza_name
order by total_price
