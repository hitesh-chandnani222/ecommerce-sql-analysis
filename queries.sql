-- Create database Meesho;
-- Use Meesho;
-- CREATE TABLE ecommerce (
--     order_id VARCHAR(20),
--     customer_id VARCHAR(20),
--     customer_name VARCHAR(100),
--     product_id VARCHAR(20),
--     product_name VARCHAR(100),
--     category VARCHAR(50),
--     price INT,
--     quantity INT,
--     discount_percent INT,
--     total_sales DECIMAL(10,2),
--     order_date DATE,
--     country VARCHAR(50),
--     payment_mode VARCHAR(50),
--     order_status VARCHAR(50)
-- );
-- Drop table ecommerce;

-- CREATE TABLE customers (
--     customer_id VARCHAR(20) PRIMARY KEY,
--     customer_name VARCHAR(100),
--     country VARCHAR(50)
-- );

-- CREATE TABLE products (
--     product_id VARCHAR(20) PRIMARY KEY,
--     product_name VARCHAR(100),
--     category VARCHAR(50),
--     price INT
-- );

-- CREATE TABLE orders (
--     order_id VARCHAR(20) PRIMARY KEY,
--     customer_id VARCHAR(20),
--     order_date DATE,
--     payment_mode VARCHAR(50),
--     order_status VARCHAR(50),
--     
--     FOREIGN KEY (customer_id)
--     REFERENCES customers(customer_id)
-- );

-- CREATE TABLE order_details (
--     order_id VARCHAR(20),
--     product_id VARCHAR(20),
--     quantity INT,
--     discount_percent INT,
--     total_sales DECIMAL(10,2),

--     FOREIGN KEY (order_id)
--     REFERENCES orders(order_id),

--     FOREIGN KEY (product_id)
--     REFERENCES products(product_id)
-- );

-- Select *
-- From customers;


-- Select c.* , o.*
-- From orders o 
-- Join customers c 
-- On c.customer_id = o.customer_id
-- Where o.payment_mode = 'cash' And o.order_status = 'cancelled';

-- Beginner SQL
-- Q1. Display all records from customers table.
SELECT * 
FROM customers;

-- Q2. Display customer names and countries.
SELECT Customer_name, Country
FROM Customers;

-- Q3. Find all unique countries.
SELECT DISTINCT country
From customers;

SELECT DISTINCT customer_name, country
FROM customers;

-- Q4. Find total number of orders.
Select Count(order_id)
from orders;

-- Q5. Display products with price greater than 100.
Select product_id, price
From products
Where price > 100;

-- Q6. Find all delivered orders.
-- Select * from orders;
Select order_id, order_status
From orders
Where order_status = 'delivered';

-- Q7. Display top 10 expensive products.
-- Select * From Products;

Select *
From products
Order by price Desc
Limit 10;

-- Q8. Find total sales amount.
-- Select * From order_details;
Select Sum(Total_sales) as Total_Revenue
From order_details;

-- Q9. Find average order value.
-- Select * From order_details;
Select Avg(total_sales) as avg_order_value
From order_details;
-- OR
Select Round(avg(total_sales),2) as avg_order_value
From order_details;


-- Q10. Display orders placed after 2023.
Select *
From orders
Where Year(order_date) > '2023';

-- Q11. Find all products in Electronics category.
Select product_name, category
from products
Where category = 'electronics';

-- Q12. Display customers from India.
Select *
From customers
Where country = 'India';

-- Q13. Find all cancelled orders.
Select * 
From orders 
Where order_status = 'cancelled';

-- Q14. Display products cheaper than 50
Select *
From products
Where price < 50;

-- Q15. Show all orders paid using PayPal.
Select *
From orders
Where payment_mode = 'paypal';

-- Q16. Find the minimum product price.
Select MIN(price)
From products;
-- OR
SELECT *
FROM products
ORDER BY price ASC
LIMIT 1;

-- Q17. Find the maximum product price.
Select Max(Price)
From Products;
-- Or
Select *
From products
Order By Price Desc
Limit 1;

-- Q18. Display first 20 customers
Select * 
From customers
Limit 20;

-- Q19. Display orders sorted by order date descending.
Select *
From orders
Order by Order_date DESC;

-- Q20. Find distinct payment modes.
Select distinct(payment_mode)
From orders;

-- Q21. Show products between price 50 and 200.
Select *
From products
Where price between 50 AND 200;

-- Q22. Display orders placed in January 2024.
Select * 
From orders
Where order_date between '2024-01-01' And '2024-01-31';
-- Or
Select *
From Orders
Where Year(order_date)=2024
And Month(order_date)=1;

-- Q23. Find all returned orders.
Select *
From orders
Where order_status= 'returned';

-- Q24. Show all countries in alphabetical order.
Select *
From customers
Order BY country ASC;

-- Filtering & Sorting

-- Q25. Display products sorted by category.
Select *
From products
Order by Category ASC;

-- Q26. Find products with price not equal to 100.
Select *
From products
Where price != 100;
-- Or
Select * 
From products
Where price <> 100;

-- Q27. Display customers whose names start with 'Customer_1'.
Select *
From customers
Where customer_name Like 'Customer_1%';

-- Q28. Find orders placed between two specific dates.
Select *
From orders
Where order_date Between '2022-08-12' And '2023-01-10';

-- Q29. Show products sorted by price ascending.
Select *
From products
Order by price ASC;

-- Q30. Display customers not from USA.
Select *
From Customers
Where country <> 'USA';

-- Q31. Find orders with payment mode UPI.
Select *
From orders
Where payment_mode= 'UPI';

-- Q32. Show orders with status Pending.
Select *
From orders
Where order_status = 'pending';

-- Q33. Find customers from Germany or UK.
Select *
From customers
Where country = 'Germany' or country= 'UK';

-- Q34. Display products with category Clothing.
Select *
From products
Where category = 'clothing';

-- Q35. Show orders before 2022.
Select *
From orders
Where Year (order_date) < 2022;

-- Q36. Find customers whose names end with 5.
Select *
From customers
Where customer_name Like '%5';

-- Q37. Display products with price IN (80,120,500).
Select *
From products
Where price in (80,120,500)
Order by Price desc;

-- Q38. Show orders where payment mode is not Cash.
Select *
From orders
Where payment_mode != 'Cash';
-- Or
Select *
From orders
Where payment_mode <> 'Cash';

-- Q39. Find products with category not Electronics.
Select *
From products
Where category <> 'electronics';

-- Q40. Display latest 15 orders.
Select *
From orders
Order By order_date DESC
Limit 15;

-- Q41. Find orders with order_id greater than O1000.
Select *
From orders
Where order_id > 'O1000';

-- Q42. Display products ordered alphabetically.
Select *
From products
Order by product_name ASC;

-- Q43. Find customers with names containing '50'.
Select *
From customers
Where customer_name like '%50%';

-- Q44. Show all orders from Canada.
Select c.country, o.*
From Customers c 	
Join orders o
On c.customer_id = o.customer_id
Where country = 'canada';

-- Q45. Display orders sorted by payment mode.
Select *
From orders
Order By Payment_mode ASC;


-- Aggregate Functions
-- Q46. Find total quantity sold.

Select 
Ifnull(product_id, 'Grand Total') AS product_id,
Sum(quantity) as total_quantity
From order_details
Group By Product_id with rollup;

-- Q47. Find average quantity per order.
Select order_id,
Round(Avg(quantity)) AS avg_quantity
From order_details
Group by order_id; 

-- Q48. Find total revenue for Electronics category.
Select p.category, p.product_id,
Sum(o.total_sales) as Total_revenue
From order_details o
Join products p
On p.product_id=o.product_id
Where category = 'electronics'
Group By p.category, p.product_id;

-- Q49. Find average product price.
Select ifnull(product_name, 'Avg_product_price') AS product_name,
Avg(price) AS avg_price
From products
Group by product_name with rollup;

-- Q50. Find total sales for delivered orders.
Select Sum(od.total_sales) As Revenue_from_delivered_orders
From order_details od
Join orders o
On o.order_id=od.order_id
Where order_status = 'delivered';

-- Q51. Find total sales for cancelled orders.
Select ifnull(o.order_id,'Total') as order_id,
Sum(od.total_sales) as revenue_lost
From order_details od
Join orders o
On o.order_id=od.order_id
Where o.order_status='cancelled'
Group By o.order_id with rollup;

-- Q52. Count number of customers per country.
Select ifnull(country, 'total_customers') as country,
count(customer_id) as Total_customers
From customers
Group By country with rollup;

-- Q53. Find highest order value.
Select *
From order_details
Order by total_sales DESC
Limit 1;
-- Or
Select * 
From order_details
Where total_sales = (Select MAX(total_sales)
From order_details);

-- Q54. Find lowest order value.
Select *
From order_details
Order By total_sales ASC
Limit 1;
-- Or
Select * 
From order_details
Where total_sales=(select MIN(total_sales)
From order_details);

-- Bonus Question: Select Orders with maximum discount and minimum sales, Also display product price:
Select od.* , p.price
From order_details od
Join products p
On od.product_id = p.product_id

Where discount_percent = (Select Max(discount_percent)
From order_details
) 
AND Total_sales = (Select MIN(total_sales)
From order_details);


-- Q55. Count number of products per category.
Select Category, product_name, 
Count(product_id) as total_products
From products
Group by category, product_name;
-- Or
Select ifnull(category,'total_products') as category,
Count(product_id) as Total_products
From products
Group by category with rollup;
-- Or
SELECT IFNULL(category,'TOTAL_CATEGORY') AS category,
       IFNULL(product_name,'TOTAL_PRODUCTS') AS product_name,
       COUNT(product_id) AS total_products
FROM products
GROUP BY category, product_name
WITH ROLLUP;

-- Bonus_Question: Show total product category wise and include all product_names using separator; 
Select IFNULL(category,'TOTAL') AS category,
Count(product_id) as total_products,
Group_Concat(product_name separator ' & ') As product_names
From products
Group By category with rollup;

-- Q56. Find average discount percentage.
Select Avg(discount_Percent)
From order_details;
-- OR
Select od.Product_id,  p.product_name, p.category,
 Avg(discount_percent) as AVG_Discount_Percent
From order_details od
Join Products p
ON p.product_id = od.product_id
Group BY od.product_id, p.product_name, p.category
Order By AVG_discount_percent Desc;

-- Q57. Find total orders per payment mode.
Select Payment_mode, 
Count(order_id) 
From orders
Group By payment_mode;
-- OR
Select ifnull(Payment_mode,'total_orders') as total_orders, 
Count(order_id) 
From orders
Group By payment_mode with rollup;

-- Q58. Count number of returned orders.
Select COunt(order_id) as returned_orders, product_id
From orders
Where order_status= 'Returned'
Group By product_id;

-- Q59. Find total revenue from Clothing products.

Select p.category, 
Sum(od.total_sales) as Clothing_sales
From order_details od
Join products p 
On od.product_id=p.product_id
Where category = 'clothing'
Group by p.category;

-- Q60. Find average revenue per product.
Select p.product_name,
ROUND(AVG(od.total_sales),2) as avg_sales
From order_details od
Join products p
On od.product_id = p.product_id
Group by product_name;

-- Q61. Find highest quantity ordered.
Select *
From order_details
Order By quantity Desc
Limit 5;
-- OR
Select *
from order_details
Where Quantity= (Select MAX(Quantity) as max_quantity
From order_details);

-- Q62. Find lowest quantity ordered.
Select *
From order_details
Order by quantity ASC
Limit 5;
-- OR
Select *
From order_details
Where quantity= (Select MIN(Quantity) as min_quantity
From order_details);

-- Q63. Count orders after 2023.
Select Count(order_id) as Total_orders
From orders
Where Year(order_date) > 2023;

-- Q64. Find total sales grouped by order status.
Select o.order_status,
Sum(od.total_sales) as Total_Reveneue
From orders oz
Join order_details od
On o.order_id = od.order_id
Group by o.order_status;

-- Q65. Find average sales grouped by payment mode.

Select o.payment_mode, 
Round(Avg(od.total_sales),2) as AVG_Sales
From order_details odz
Join orders o
On o.order_id = od.order_id
Group By o.payment_mode;

-- GROUP BY & HAVING

-- Q66. Find total orders per country.
Select Ifnull(c.country, 'Total_orders') as Country,
Count(o.order_id) as total_orders
From orders o
Join customers c
On c.customer_id = o.customer_id
Group By c.country with rollup;

-- Q67. Find total revenue per category.

Select category,
Sum(od.total_sales) as total_revenue
From order_details od
Join products p
On od.product_id = p.product_id
group By p.category;


-- Q68. Find average sales per country.
Select c.country, 
Round(AVG(od.total_sales),2) as Sales_by_region
From order_details od
Join orders o 
On o.order_id = od.order_id
Join customers c 
on c.customer_id=o.customer_id
Group By c.country;

-- Q69. Find customers with more than 5 orders.
Select customer_id,
Count(order_id) as total_orders
From orders
group by customer_id
Having Count(Order_id) > 5
Order By total_orders DESC;

-- Q70. Find categories with average price above 100.
Select Category, 
AVG(Price) as avg_price
From products
Group By category
Having AVG(Price) >100;

-- Q71. Find countries having more than 500 customers.

Select Country,
Count(customer_id) as total_customers
From customers
Group by country
Having Count(Customer_id) > 500;

-- Q72. Find payment modes with more than 2000 orders.
Select Payment_mode, 
Count(order_id) as total_orders
From orders
Group By payment_mode
Having Count(order_id) > 2000;

-- Q73. Find total sales per product.
-- <<SHow revenue greater than 511536.00>>

Select p.product_name,
SUM(od.Total_Sales) as Total_revenue
From order_details od
Join products p 
On od.product_id = p.product_id
Group By p.product_name
Having Sum(od.total_Sales) > 511536.00;

-- Q74. Find top 3 countries by revenue.
Select c.country,
Sum(Total_Sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group By c.country
Order By total_revenue DESC
Limit 3;

-- Q75. Find categories with total sales above 500000.

Select ifnull(p.category, 'total_sales') as category,
SUM(od.total_sales) as total_revenue
From order_details od 
Join products p 
On p.product_id = od.product_id
Group By p.category with rollup
Having SUM(od.total_sales) > 500000;

-- Q76. Find customers with total spending above 5000.
Select 
   c.customer_id,  
   c.customer_name,
SUM(od.total_sales) as total_revenue
From order_details od

Join orders o
On od.order_id = o.order_id

Join customers c
On c.customer_id = o.customer_id

Group By c.customer_id, c.customer_name
Having Sum(od.total_sales) > 5000
Order By total_revenue DESC;

-- Q77. Find products sold more than 1000 times.
Select p.product_name,
Sum(quantity) as total_quantity
From order_details od
Join products p
On od.product_id = p.product_id
Group By p.product_name 
Having Sum(quantity) > 1000
Order BY total_quantity DESC;

-- Q78. Find average discount by category.
Select p.category,
Round(AVG(od.discount_percent),2) as avg_discount
From order_details od
Join products p 
On od.product_id = p.product_id
Group By category
Order By avg_discount DESC;

-- Q79. Find total quantity sold per category.
Select p.category, 
Sum(Quantity) as total_quantity
From order_details od
Join products p
On p.product_id = od.product_id
Group By p.category
Order By total_quantity DESC;

-- Q80. Find order statuses with least orders.
Select order_status, 
Count(Order_ID) as total_orders
From orders
Group by order_status
Order BY total_orders ASC;

-- Q81. Find products with average sales above 400.

Select product_name, 
Round(AVG(total_sales),2) as avg_sales
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.product_name 
Having AVG(total_sales) > 400
Order By avg_sales DESC;

-- Q82. Find customers with exactly 2 orders.
Select c.customer_id, c.customer_name, 
Count(o.order_id) as total_orders
From orders o
Join customers c
on o.customer_id = c.customer_id
Group By c.customer_id, c.customer_name
Having Count(o.order_id) =2;

-- Q83. Find revenue contribution by country.
Select c.country,
Round(SUM(od.total_sales),2) as total_revenue
From order_details od
   Join orders o
   On o.order_id = od.order_id
   Join customers c
   On o.customer_id = c.customer_id
Group By c.country
Order By total_revenue DESC;

-- Q84. Find top 5 customers by total sales.
Select c.customer_id, c.customer_name,
ROUND(SUM(od.total_sales),2) as total_revenue
From order_details od
    Join orders o
    ON o.order_id = od.order_id
    Join customers c
    On c.customer_id = o.customer_id
Group By c.customer_id, c.customer_name
Order By total_revenue DESC
Limit 5;

-- Q85. Find categories having fewer than 3 products.
Select Category,
Count(product_name) as total_products
From products
Group By category
Having count(product_name) <3;

-- JOINS

-- Q86. Display customer names with their order dates.
Select o.order_date, c.customer_id, c.customer_name
From orders o
Join customers c
On c.customer_id = o.customer_id
Order By order_date ASC;

-- Q87. Find products ordered by each customer.
Select od.product_id, p.product_name, c.customer_id, c.customer_name, 
Sum(quantity) as total_quantity
From order_details od
     Join orders o
	 On od.order_id = o.order_id
     Join customers c
     On c.customer_id = o.customer_id
	 Join products p
     On p.product_id = od.product_id
Group BY od.product_id, p.product_name, c.customer_id, c.customer_name
Order By total_quantity DESC;

-- Q88. Find total sales by customer.
Select c.customer_id, c.customer_name, 
Round(Sum(od.total_sales),2) as total_revenue
From order_details od
        Join orders o
	    On o.order_id = od.order_id
        Join customers c
        On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name
Order By total_revenue DESC;

-- Q89. Display orders with customer country.
Select c.* , o.*
From orders o
Join customers c
On c.customer_id = o.customer_id;

-- Q90. Find products purchased in each order.
Select od.order_id , p.product_name, od.quantity
From order_details od
Join products p
On p.product_id = od.product_id;

-- Q91. Display customer names with payment modes. 
-- Additional Qns by self (show_highest_payment_mode by_customer) 
Select c.customer_name , o.payment_mode,
Count(o.order_id) as total_orders
From orders o
Join customers c
On c.customer_id = o.customer_id
Group By c.customer_name , o.payment_mode
Order BY total_orders Desc;

-- Q92. Find all customers who ordered Electronics products.
Select c.customer_id, c.customer_name, p.category, 
Sum(od.quantity) as total_quantity
From order_details od
Join orders o	
On o.order_id = od.order_id
Join Products p
on p.product_id = od.product_id
Join customers c
on c.customer_id = o.customer_id
Group By c.customer_id, c.customer_name, p.category
Order By total_quantity DESC;

-- Q93. Display order details with product names.

Select od.* , p.product_name
From order_details od
Join products p
On p. product_id = od.product_id;

-- Q94. Find total revenue generated by each product.
Select p.product_name, p.category,
SUM(Total_sales) as total_revenue
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.product_name, p.category
Order By total_revenue DESC;

-- Q95. Find customers who never placed orders.

Select c.customer_id, c.customer_name, o.order_id
From customers c
Left Join orders o
On c.customer_id = o.customer_id
Where o.order_id is NULL;

-- Q96. Find products never ordered.
Select p.product_name, od.order_id
From products p
Left Join order_details od
On od.product_id = p.product_id
Where od.order_id is NULL;

-- Q97. Display LEFT JOIN between customers and orders.
Select c.customer_id, 
       c.customer_name, 
       c.country, 
       o.order_id, 
       o.order_date,
       o.payment_mode, 
       o.order_status
From customers c 
Left Join orders o
On c.customer_id=o.customer_id;

-- Q98. Display INNER JOIN between orders and order_details.
Select 
	   o.order_id, o.customer_id, o.order_date, o.payment_mode, o.order_status,
       od.product_id, od.quantity, od.discount_percent, od.total_sales
From orders o
Inner Join order_details od
On o.order_id = od.order_id;

-- Q99. Find highest spending customer.
Select c.customer_id, c.customer_name,
Sum(total_sales) as total_revenue
From order_details od
Join orders o
on o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name, od.total_sales
Order BY total_revenue DESC;

-- Q100. Find most ordered product.

Select p.product_name,
Sum(quantity) as total_units_sold
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.product_name
Order BY total_units_sold DESC;

-- Q101. Find least ordered product.
Select p.product_name,
Sum(quantity) as total_units_sold
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.product_name
Order BY total_units_sold ASC
Limit 1;

-- Q102. Find top revenue generating country.
Select c.country, 
Sum(total_sales) as total_revenue
from order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
ON c.customer_id = o.customer_id
Group By c.country
Order By total_revenue DESC
Limit 1;

-- Q103. Find total sales by payment mode.
Select ifnull(o.payment_mode, 'total_sales') as payment_mode, 
Sum(total_sales) as total_revenue
From order_details od
Join orders o
ON o.order_id = od.order_id
Group By o.payment_mode with rollup
Order By total_revenue ASC;

-- Q104. Display all cancelled orders with customer names.
Select c.customer_id, c.customer_name, o.order_status
From customers c
Join orders o
ON c.customer_id = o.customer_id
Where o.order_status = 'cancelled';

-- Q105. Find products purchased by customers from India.
Select c.customer_id, c.customer_name, c.country,
p.product_id, p.product_name,
Sum(od.quantity) as total_purchase
From order_details od
Join products p
on p.product_id = od.product_id
Join orders o
On o.order_id = od.order_id
Join customers c
On o.customer_id = c.customer_id
Where c.country = 'India'
Group By c.customer_id, c.customer_name,
p.product_id, p.product_name;

-- Q106. Find customers who bought Clothing items.
Select c.customer_id, c.customer_name, p.category
From products p 
Join order_details od
On p.product_id = od.product_id
Join orders o
On od.order_id = o.order_id
Join customers c
On o.customer_id = c.customer_id
Where p.category = 'clothing'
Group By c.customer_id, c.customer_name, p.category;

-- Q107. Display orders along with discount percentage.

Select o.order_id, o.customer_id, o.order_date, o.order_status, od.discount_percent, od.total_sales
From order_details od
Join orders o
On o.order_id = od.order_id;

-- Q108. Find average order value by country.

Select c.country, 
Round(AVG(od.total_sales),2) as AVG_Revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group By c.country
Order by AVG_Revenue DESC;

-- Q109. Display orders with product categories.
Select od.*, p.category
From order_details od
Join products p
on od.product_id = p.product_id;

-- Q110. Find products purchased using PayPal.

Select distinct(p.product_name), o.payment_mode
from orders o 
Join order_details od
On o.order_id = od.order_id
Join products p
On od.product_id = p.product_id
Where o.payment_mode = 'Paypal';
 
-- Q111. Find countries contributing highest sales.
Select c.country, 
Sum(total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On o.customer_id = c.customer_id
Group By c.country
Order By total_revenue DESC
Limit 5;

-- Q112. Display customer names and ordered product names.
Select c.customer_id, c.customer_name, p.product_id, p.product_name,
Sum(quantity) as total_ordered_quantity
From order_details od
Join products p
On p.product_id = od.product_id
Join orders o
On o.order_id = od.order_id
Join customers c
On o.customer_id = c.customer_id
Group by  c.customer_id, c.customer_name, p.product_id, p.product_name
Order By total_ordered_quantity DESC;

-- Q113. Find total quantity purchased by each customer.
Select c.customer_id, c.customer_name, p.product_id, p.product_name,
Sum(quantity) as total_ordered_quantity
From order_details od
Join products p
On p.product_id = od.product_id
Join orders o
On o.order_id = od.order_id
Join customers c
On o.customer_id = c.customer_id
Group by  c.customer_id, c.customer_name, p.product_id, p.product_name
Order By total_ordered_quantity DESC;

-- Q114. Find revenue generated by each category.

Select p.category, 
Sum(total_sales) as total_revenue
From order_details od
Join products p 
On p.product_id = od.product_id
Group By p.category
Order By total_revenue DESC;

-- Q115. Display all delivered orders with customer details.
Select c.customer_id, c.customer_name, o.order_id, o.order_date, o.payment_mode, o.order_status
From orders o
Join customers c
On c.customer_id = o.customer_id
Where order_status = 'delivered';

-- Q116. Find customers whose spending is above average
SELECT c.customer_id,
       c.customer_name,
       SUM(od.total_sales) AS total_spending
FROM order_details od
JOIN orders o
ON od.order_id = o.order_id
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(od.total_sales) >
(SELECT AVG(customer_total)
FROM (SELECT SUM(od.total_sales) AS customer_total
FROM order_details od
JOIN orders o
ON od.order_id = o.order_id
GROUP BY o.customer_id) avg_table);

-- Q117. Find second highest priced product.

Select product_name, price
From products
Order By price DESC
Limit 1 offset 1;

-- Q118. Find products priced above average price.
Select product_name, price
From products
Where price > 
(Select AVG(price) 
From products );

-- Q119. Find countries with more customers than India.
Select country,
Count(customer_id) as total_customers
From customers
Group By country
Having count(customer_id) > (Select COUNT(customer_id) 
from customers
Where country = 'india');

-- Q120. Find customers with highest number of orders.
Select c.customer_id, c.customer_name,
Count(distinct o.order_id) As total_orders, 
SUM(od.quantity) As total_quantity
From orders o
Join order_details od
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group By c.customer_id, c.customer_name
Order BY total_orders , total_quantity DESC;

-- Q121. Find products with sales higher than average sales.
Select p.product_id, p.product_name, p.category,
Sum(total_sales) as total_revenue
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.product_id, p.product_name, p.category
Having Sum(total_sales) > (Select AVG(Avg_total_sales) From (Select SUM(Total_Sales) as Avg_total_sales From order_details
Group By product_id) avg_product);

-- CTE Version
WITH product_sales AS
(
    SELECT p.product_id,
           p.product_name,
           SUM(od.total_sales) AS total_revenue
    FROM order_details od
    JOIN products p
    ON p.product_id = od.product_id
    GROUP BY p.product_id,
             p.product_name
)
SELECT *
FROM product_sales
WHERE total_revenue >
(
    SELECT AVG(total_revenue)
    FROM product_sales
);


-- Q121. Find products with sales higher than average sales.
-- CTE Version

With Products_table as
(
Select p.product_name,
SUM(total_sales) as total_revenue
From order_details od
Join products p 
On p.product_id = od.product_id
Group By p.product_name
Order By total_revenue DESC)
Select *
from products_table
Where total_revenue > (select avg(total_revenue) 
From products_table);


-- Q121. Find products with sales higher than average sales.
Select p.product_id, p.product_name, p.category,
Sum(od.total_sales) as total_revenue
From order_details  od
Join products p
On p.product_id = od.product_id
Group BY p.product_id, p.product_name, p.category
Having Sum(od.total_sales) > 
(Select AVG(Product_total) 
from (Select Sum(total_sales) As product_total 
from order_details
Group BY product_id ) AVG_table);

-- Q122. Find customers who placed latest orders.
Select c.customer_id, c.customer_name, o.order_id, o.order_date, o.payment_mode, o.order_status
From orders o
Join customers c
On c.customer_id= o.customer_id
Order By order_date DESC
Limit 50;

-- Using_subquery_only_selecting_one_order_per_customer
Select c.customer_id, c.customer_name, o.order_id, o.order_date, o.payment_mode, o.order_status
From orders o
Join customers c
On c.customer_id= o.customer_id
Where o.order_date = 
(
select Max(o2.order_date)
From orders o2
Where o2.customer_id = o.customer_id);

-- Q123. Find orders with highest discount.
Select order_id, product_id, quantity, discount_percent, total_sales
From order_details
Where discount_percent = 
(
select MAX(discount_percent) 
from order_details
);

-- Q124. Find products never purchased.

Select p.product_id, p.product_name
From products p 
Left Join order_details od
On p.product_id = od.product_id
Where total_sales is Null;

-- Q125. Find customers with exactly one order.

Select customer_id, order_id,
Count(order_id) as order_count
From orders
Group by customer_id, order_id
Having count(order_id) = 1;

-- Q126. Find highest revenue category.
Select p.category,
Sum(od.total_sales) as total_revenue
From order_details od
Join products p
On od.product_id = p.product_id
Group By p.category
Order By total_revenue DESC
Limit 1;

-- Q127. Find products with lowest sales.

Select p.product_name, 
Sum(total_sales) as total_revenue
From order_details od
Join products p
On p.product_id = od.product_id
Group By p.product_name
Order By total_revenue ASC
Limit 1;

-- Q128. Find countries with lowest revenue.
Select c.country,
Sum(od.total_sales) as total_revenue
From order_details od
Join orders o
on o.order_id = od.order_id
Join customers c
on c.customer_id = o.customer_id
Group By c.country
Order By total_revenue ASC
Limit 3;

-- Q129. Find customers who spent less than average.
Select c.customer_id, c.customer_name, 
Sum(total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group By c.customer_id, c.customer_name
Having Sum(od.total_sales)< (select AVG(total_sales_o) from (select SUM(total_sales) as total_sales_o 
From order_details od
Join orders o  On o.order_id= od.order_id
Group By o.customer_id) avg_table)
Order By total_revenue ASC;

-- Q130. Find orders above average order value.
Select order_id,
Sum(total_sales) as total_revenue
From order_details
Group By order_id
Having Sum(total_sales) > (Select AVG(order_value) from (Select SUM(total_sales) as order_value from order_details
Group by order_id) avg_order);

-- Q131. Find products with quantity above average quantity.

Select od.product_id, p.product_name,
SUM(Quantity) as total_quantity
From order_details od
Join products p 
On p.product_id = od.product_id
Group By od.product_id, p.product_name
Having sum(quantity) > (Select AVG(product_quantity) from (Select Sum(Quantity) as product_quantity From order_details
Group BY product_id) avg_quantity);

-- Q132. Find payment modes used more than average.
Select payment_mode, 
Count(order_id) as total_orders
From orders
Group By payment_mode
Having Count(order_id) > 
(
Select AVG(total_order_count) 
from (
Select Count(order_id) AS total_order_count 
from orders
Group By payment_mode) 
avg_payment_mode 
);

-- Q133. Find countries having sales below average.
Select c.country,
Sum(od.total_sales) as total_revenue
From order_details od
         Join orders o
		 On o.order_id = od.order_id
         Join customers c
         On c.customer_id = o.customer_id
Group BY c.country
Having Sum(od.total_sales) < (Select AVG(country_revenue)
              From (
                    Select Sum(od.total_sales) as country_revenue
                    From order_details od
						Join orders o 
                        On o.order_id = od.order_id
                        Join customers c
                        On c.customer_id = o.customer_id
Group BY c.country) avg_country);

-- Q134. Find products purchased by top customers.
Select c.customer_id, c.customer_name, p.product_name,
Sum(total_sales) as total_revenue
From order_details od
	   Join orders o
       On od.order_id = o.order_id
       Join products p
       On p.product_id = od.product_id
       Join customers c 
       On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name, p.product_name
Order By total_revenue DESC
Limit 10;

-- Q135. Find customers from country with highest revenue.
SELECT distinct c.customer_id, c.customer_name, c.country,
SUM(od.total_sales) AS total_revenue
FROM order_details od
JOIN orders o ON o.order_id = od.order_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE c.country = (SELECT c.country
    FROM order_details od
    JOIN orders o
    ON o.order_id = od.order_id
    JOIN customers c
    ON c.customer_id = o.customer_id
    GROUP BY c.country
    ORDER BY SUM(od.total_sales) DESC
    LIMIT 1)
GROUP BY c.customer_id, c.customer_name,c.country
ORDER BY total_revenue DESC;


-- Q136. Create CTE for total sales by country.
With country_sales as(
Select c.country,
SUM(total_sales) as total_revenue
From order_details as od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group by c.country)
Select * 
From country_sales;

-- Q137. Find top 5 customers using CTE.
With Top_customers as
( Select c.customer_id, c.customer_name,
Sum(total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id=od.order_id
Join customers c
On c.customer_id = o.customer_id
Group BY c.customer_id,c.customer_name)
Select *
From top_customers
Order BY total_revenue DESC
LIMIT 5;

-- Q138. Find monthly revenue trend using CTE.
WITH monthly_revenue as 
( Select Year(o.order_date) as order_year,
		 Month(o.order_date) as order_month,
         Sum(od.total_sales) as total_sales
From order_details od
Join orders o
On o.order_id = od.order_id
Group By Year(o.order_date),
		 Month(o.order_date))
Select * 
From monthly_revenue
Order BY order_year DESC,  order_month DESC;

-- Q139. Find top-selling products using CTE.
With top_products as
( Select p.product_id, p.product_name,
SUM(total_sales) as total_revenue
From order_details od
Join products p
On od.product_id = p.product_id
Group By p.product_id, p.product_name
)Select * 
From top_products
Order By total_revenue DESC
Limit 3;

-- Q140. Find inactive customers using CTE.
With inactive_customers AS
(Select c.customer_id , c.customer_name, o.order_id
From customers c
Left Join orders o
On c.customer_id = o.customer_id)
Select *
From inactive_customers
Where order_id is NULL;

-- Q141. Find repeat customers using CTE.
With loyal_customers as (
Select c.customer_id, c.customer_name, 
Count(order_id) as order_count
	 From orders o
     Join customers c
     On c.customer_id = o.customer_id
Group By c.customer_id, c.customer_name)
Select * 
From loyal_customers
Where order_count > 1
Order BY order_count DESC;

-- Q142. Find categories with declining sales using CTE. Without window function
With declining_categories AS (
Select p.category,
	   Year(o.order_date) as order_year,
       Month(o.order_date) as order_month,
       Sum(od.total_sales) as total_revenue
From order_details od
     Join orders o
     On o.order_id = od.order_id
     Join products p
     On od.product_id = p.product_id
Group By p.category,
         Year(o.order_date),
         Month(o.order_date))
Select *
From declining_categories
Order BY category, order_year, order_month;

-- Q143. Find average order value by month using CTE.
With avg_order_value as (
Select 
Year(o.order_date) as order_year,
Month(o.order_date) as order_month,
Round(AVG(total_sales),2) as avg_sales
From order_details od
	    Join orders o
        On o.order_id=od.order_id
Group By 
        Year(o.order_date),
        Month(o.order_date))
Select * 
From avg_order_value
Order By order_year DESC ,order_month DESC;

	WITH order_values AS
	(SELECT o.order_id,
			   YEAR(o.order_date) AS order_year,
			   MONTH(o.order_date) AS order_month,
			   Round(SUM(od.total_sales),2) AS order_value
		FROM orders o
		JOIN order_details od
			ON o.order_id = od.order_id
		GROUP BY o.order_id,
				 YEAR(o.order_date),
				 MONTH(o.order_date))
	SELECT order_year,
		   order_month,
		   Round(AVG(order_value),2) AS avg_order_value
	FROM order_values
	GROUP BY order_year,
			 order_month
	ORDER BY order_year DESC,
			 order_month DESC;
-- Q144. Display customer ranking using CTE. Without window function
WITH customer_ranking AS (
SELECT c.customer_id, c.customer_name, 
SUM(od.total_sales) as total_revenue
FROM order_details od
            JOIN orders o
            ON o.order_id = od.order_id
            JOIN customers c
            On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name)
Select * 
From customer_ranking
Order By Total_revenue DESC;

-- Q145. Find countries with highest growth using CTE.

-- Q146. Find top revenue orders using CTE.

WITH top_orders AS (
SELECT order_id, 
SUM(total_sales) as total_revenue
FROM order_details
GROUP BY order_id)
SELECT  order_id, DISTINCT total_revenue
FROM top_orders
ORDER BY total_revenue DESC;

-- Q147. Find products with no recent sales using CTE.
WITH recent_products AS
(
    SELECT DISTINCT od.product_id
    FROM order_details od
    JOIN orders o
        ON o.order_id = od.order_id
    WHERE o.order_date =
          ( SELECT MAX(order_date)
			FROM orders ) )
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN recent_products rp
       ON p.product_id = rp.product_id
WHERE rp.product_id IS NULL;

-- Q148. Find customers contributing 50% revenue using CTE.
Select * From orders;

WITH loyal_customers AS (
Select c.customer_id, c.customer_name, od.order_id,
SUM(total_sales) as total_revenue
From order_details od 
Join orders o
On o.order_id= od.order_id
Join products p
On p.product_id = od.product_id
Join customers c
On c.customer_id = o.customer_id

Group BY c.customer_id, c.customer_name, od.order_id)

Select * from loyal_customers;

-- Q149. Create recursive CTE example.
WITH RECURSIVE numbers AS
( SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
) SELECT *
FROM numbers;

-- Q150. Find payment mode trends using CTE.
WITH payment_trends AS
(
    SELECT YEAR(order_date) AS order_year,
           MONTH(order_date) AS order_month,
           payment_mode,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY YEAR(order_date),
			 MONTH(order_date),
             payment_mode
) SELECT *
FROM payment_trends
ORDER BY order_year, order_month;

-- Q151. Rank customers by revenue.
WITH total_revenue AS (
Select c.customer_id, 
       c.customer_name, 
       SUM(od.total_sales) as total_sales1
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name )
Select customer_id, customer_name, total_sales1,
RANK() OVER(ORDER BY total_sales1 DESC) AS customer_rank
From total_revenue;

-- Q152. Dense rank products by sales.

WITH product_rank AS (
Select p.product_id, p.product_name,
SUM(total_sales) as total_revenue
From order_details od
Join products p
ON p.product_id = od.product_id
Group BY p.product_id, p.product_name)

Select product_id, product_name, total_revenue,
DENSE_RANK() OVER(ORDER BY total_revenue DESC) AS product_rank
From product_rank;

-- Q153. Find running total of sales.
WITH running_sales AS (
Select YEAR(o.order_date) AS order_year,
       Month(o.order_date) AS order_month, 
       SUM(od.total_sales) as total_revenue
From orders o
Join order_details od 
ON o.order_id = od.order_id
Group BY Year(o.order_date),
         Month(o.order_date) 
)
Select order_year, order_month, total_revenue,
SUM(total_revenue) OVER(ORDER BY order_month) as running_total
from running_sales
Where order_year = 2024 ;

-- Q154. Find cumulative revenue by month for electronincs category.
WITH cumulative_revenue_electronics AS (
Select Year(o.order_date) as order_year,
       Month(o.order_date) as order_month,
	   p.category,
       SUM(total_sales) as total_revenue
From orders o
Join order_details od
ON o.order_id = od.order_id
Join products p
On p.product_id = od.product_id
Group BY Year(o.order_date),
         Month(o.order_date),
	     p.category )
Select order_year, order_month, category, total_revenue,
SUM(total_revenue) OVER(Order BY Order_month) as running_total
From cumulative_revenue_electronics
Where category = 'electronics' AND
	  order_year = 2024;
	
-- Q155. Assign row numbers to orders.
Select ROW_Number() 
       OVER(ORDER BY order_id) as row_num, 
       order_id, 
       product_id, 
       quantity, 
       discount_percent, 
       total_sales
From order_details; 

-- Q156. Find top 3 products per category.
With Total_revenue AS (
Select p.category, p.product_id, p.product_name,
SUM(od.total_sales) as total_sales
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.category,p.product_id, p.product_name),
Top_products AS (
Select category, product_id, product_name, total_sales,
DENSE_RANK() OVER(Partition BY category ORDER BY total_sales DESC) AS product_rank
From total_revenue)
Select category, product_id, product_name, total_sales, product_rank
From top_products
Where product_rank <= 3
ORDER BY category, product_name, product_rank;

-- Q157. Find previous order value using LAG.
WITH previous_orders AS (
SELECT order_id,
SUM(total_sales) as total_revenue
From order_details
Group BY order_id )

Select order_id, total_revenue,
LAG(total_revenue) OVER(ORDER BY order_id ASC) as previous_order_value
From previous_orders;

-- Q158. Find next order value using LEAD.
With order_value AS (
Select order_id, 
SUM(total_sales) as total_revenue
From order_details
Group BY order_id )

Select order_id, total_revenue, 
LEAD(total_revenue) OVER(ORDER BY order_id ASC) as Lead_revenue 
From order_value;

-- Q159. Find moving average of sales.
WITH moving_avg_sales AS (
Select Year(o.order_date) AS order_year,
       Month(o.order_date) AS order_month,
       ROUND(AVG(od.total_sales),2) as avg_sales
FROM orders o
JOIN order_details od
On o.order_id = od.order_id
GROUP BY YEAR(o.order_date),
          Month(o.order_date))
Select order_year, order_month, avg_sales,
AVG(avg_sales) OVER(ORDER BY order_month 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
as running_avg_sales
FROM moving_avg_sales
Where order_year = 2024;

-- Q160. Find revenue difference between consecutive months.
USE meesho;
WITH monthly_revenue AS (
Select Year(o.order_date) as order_year,
	   MONTH(o.order_date) as order_month,
       SUM(total_sales) as total_revenue
From orders o
JOIN order_details od
ON o.order_id = od.order_id
Group BY Year(o.order_date), 
		 Month(o.order_date)),
Revenue_comparison AS (
Select order_year, order_month, total_revenue,
LAG(total_revenue) OVER(Order BY order_year, order_month) as previous_revenue
From monthly_revenue)
Select order_year, order_month, total_revenue, previous_revenue, 
       Total_revenue - previous_revenue as revenue_difference
FROM revenue_comparison 
Order BY order_year, order_month;

-- Q161. Find highest sales per country using RANK.
WITH country_wise_sales AS (
SELECT c.country, 
SUM(od.total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
ON c.customer_id = o.customer_id
Group BY c.country)
Select country, total_revenue,
RANK() OVER(ORDER BY total_revenue DESC) AS rank_country
From country_wise_sales;

-- Q162. Find customer percentile ranking.
WITH customer_loyalty AS (
Select c.customer_id, c.customer_name, 
SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
ON o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name )
Select customer_id, customer_name, total_revenue,
ROUND((1- PERCENT_RANK() OVER(ORDER BY total_revenue DESC))*100 ,2) as percentile_rank
From customer_loyalty;

-- Q163. Find top customers in each country.
WITH customer_total AS (
Select c.customer_id, c.customer_name, c.country, 
SUM(od.total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
ON c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name, c.country ),
Top_customers AS (
Select customer_id, customer_name, country, total_revenue, 
DENSE_RANK() OVER(PARTITION BY country ORDER BY total_revenue DESC) as customer_rank
From customer_total)
Select * from top_customers
Where customer_rank = 1
Order By total_revenue DESC;

-- Q164. Find monthly sales growth percentage.
WITH total_sales AS (
Select YEAR(o.order_date) as order_year,
       Month(o.order_date) as order_month,
       SUM(total_sales) as total_sales
From orders o
Join order_details od
ON o.order_id = od.order_id
Group BY YEAR(o.order_date),
         MONTH(o.order_date) ),
Sales_growth AS (
Select order_year, order_month, total_sales,
LAG(total_sales) OVER (ORDER BY order_year,order_month) as previous_month
From total_sales)
Select order_year, order_month, total_sales, previous_month,
ROUND(((total_sales - previous_month) / previous_month)*100,2) as Growth_percent
From Sales_growth 
Group BY order_year, order_month, total_sales
Order BY order_year ASC, order_month ASC;


-- Q165. Find rolling 3-month sales average.
With avg_sales AS (
Select Year(o.order_date) as order_year,
	   Month(o.order_date) as order_month,
       AVG(od.total_sales) as avg_customer_revenue
From orders o
JOIN order_details od
ON o.order_id = od.order_id
Group BY YEAR(o.order_date),
          Month(o.order_date) ),
Rolling_avg AS (
Select order_year, order_month, avg_customer_revenue, 
AVG(avg_customer_revenue) OVER(ORDER BY order_year, order_month
ROWS between 2 preceding and current row) as avg_rolling
From avg_sales)
Select * From rolling_avg
WHERE order_year = 2024
Order BY order_month DESC;


-- Q166. Find orders greater than previous order.
WITH order_sales AS (
SELECT o.order_date, od.order_id,
SUM(total_sales) AS total_revenue
From order_details od
Join orders o
ON o.order_id = od.order_id
Group BY o.order_date, od.order_id ),
Previous_order_sales AS (
Select order_date, order_id, total_revenue,
LAG(total_revenue) OVER (Order BY order_ID) as Previous_order
From order_sales)
Select *, 
total_revenue - previous_order AS order_value_difference
From previous_order_sales
Where total_revenue > previous_order;

-- Q167. Find products contributing most revenue.
With product_sales AS (
Select p.product_id, p.product_name, p.category, 
       SUM(od.total_sales) as total_revenue
		From order_details od
        Join products p
        on p.product_id = od.product_id
Group BY p.product_id, p.product_name, p.category ),
total_revenue AS (
Select product_id, product_name, category, total_revenue,
RANK() OVER(ORDER BY total_revenue DESC) As product_rank
From product_sales )
SELECT * From total_revenue;


-- Q168. Find customers with consecutive orders.
WITH customer_orders AS (
SELECT c.customer_id, c.customer_name, o.order_id, o.order_date
From orders o
Join customers c
ON c.customer_id = o.customer_id 
),
Previous_order AS (
Select customer_id, customer_name, order_id, order_date,
LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_id) as previous_order_date
From customer_orders 
)
Select customer_id, customer_name, order_id, previous_order_date,
Order_date as new_order_date
from previous_order
Where DATEDIFF(order_date, previous_order_date) = 1;


-- Q169. Find top payment modes by revenue.
WITH total_revenue_by_payment_mode AS (
Select o.payment_mode, 
       SUM(total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Group BY o.payment_mode )

Select payment_mode, total_revenue, 
RANK() OVER(ORDER BY total_revenue DESC) as Rank_no
From total_revenue_by_payment_mode;

-- Q170.Find category-wise sales ranking.
WITH category_wise_sales AS (
Select p.category,
Sum(total_sales) as total_revenue
From order_details od
Join products p
On p.product_id = od.product_id
Group BY p.category 
)
Select category, total_revenue,
Rank() OVER(ORDER BY total_revenue DESC) as category_rank
From category_wise_sales;

-- Q171. Find first order per customer.
WITH customer_orders AS (
Select c.customer_id, c.customer_name, o.order_id, o.order_date
From customers c
Join orders o 
On c.customer_id = o.customer_id ),
First_order AS (
Select customer_id, customer_name, order_id, order_date, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS first_customer_order 
From customer_orders )
Select * 
from first_order
Where first_customer_order = 1;

-- Q172. Find latest order per customer.
With customer_order AS (
Select c.customer_id, c.customer_name, o.order_id, o.order_date
From customers c
Join orders o 
On c.customer_id = o.customer_id),
First_order AS (
Select customer_id, customer_name, order_id, order_date, 
ROW_NUMBER() OVER(PARTITION by customer_id ORDER BY order_date DESC) AS first_customer_order
From customer_order )
Select *
From first_order
Where first_customer_order = 1;

-- Q173. Find most expensive order per country.
WITH top_orders AS (
Select c.country, od.order_id, SUM(od.total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c 
On c.customer_id = o.customer_id
Group BY c.country, od.order_id ),
Expensive_orders AS (
Select country, order_id, total_revenue,
ROW_NUMBER() OVER(PARTITION BY Country ORDER BY total_revenue DESC) expensive_orders
From top_orders )
Select * From expensive_orders
Where expensive_orders = 1;


-- Q174. Find monthly order count trends.
Select Year(order_date) as order_year,
	   Month(order_date) as order_month, 
       Count(Order_id) as no_of_orders
From orders
Group BY Year(order_date), Month(order_date) 
Order BY order_year ASC , Order_month ASC;

-- Q175. Find cumulative quantity sold.
WITH product_total AS (
Select p.product_name, p.product_id, 
SUM(quantity) as total_quantity
From order_details od
JOIN products p
ON p.product_id = od.product_id
Group BY p.product_name, p.product_id
Order BY total_quantity DESC ),
Cumulative_quantity AS (
Select product_name, product_id, total_quantity, 
SUM(total_quantity) OVER(ORDER BY total_quantity) as cumulative_quantity
From product_total)
Select * from cumulative_quantity;

-- Q176. Calculate customer lifetime value.
Select c.customer_id, c.customer_name,
SUM(total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c 
On c.customer_id = o.customer_id
Group BY c.customer_id
Order BY total_revenue DESC;

-- Q177. Find churned customers.

Select c.customer_id, o.order_id, o.order_date
From customers c
Left Join orders o
On c.customer_id = o.customer_id
Where order_id is NULL;

-- Q178. Find peak sales month.
WITH Peak_sales AS (
Select YEAR(o.order_date) as order_year, 
	   Month(o.order_date) as order_month, 
       SUM(od.total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Group BY order_year, order_month),
Month_ranking AS (
Select order_year, order_month, total_revenue,
DENSE_RANK() OVER(ORDER BY total_revenue DESC) AS month_rank
From peak_sales)
Select * from month_ranking
Where month_rank = 1;

-- Q179. Identify seasonal sales trends.
WITH monthly_revenue AS (
Select Year(o.order_date) AS order_year,
       Month(o.order_date) as order_month_no,
       MonthNAME(o.order_date) AS order_month, 
       SUM(total_sales) as total_revenue
FROM order_details od
JOIN orders o
ON o.order_id = od.order_id
Group BY order_year, order_month, order_month_no ),
Revenue_difference AS (
Select order_year, order_month, order_month_no, total_revenue, 
LAG(total_revenue) OVER(ORDER BY order_year, order_month_no) as Previous_month_revenue
FROM monthly_revenue )
Select order_year, order_month, order_month_no, total_revenue, previous_month_revenue,
total_revenue - previous_month_revenue AS revenue_difference
from revenue_difference
Order BY order_year, order_month_no;

-- Q180. Find return rate by category.
WITH Category_wise_orders AS (
Select p.category, o.order_status,
Count(o.order_id) AS category_order_count
From orders o
JOIN order_details od
ON o.order_id = od.order_id
Join products p
On p.product_id = od.product_id
Where o.order_status = 'returned'
Group BY p.category, o.order_status),
Total_order_count AS (
Select p.category, Count(o.order_id) total_order_count
FROM orders o
JOIN order_details od
ON o.order_id = od.order_id
JOIN products p
ON p.product_id = od.product_id
GROUP BY p.category )
Select c.category, c.category_order_count, t.total_order_count, 
ROUND((c.category_order_count * 100.0) /t.total_order_count,2) AS return_rate
From total_order_count t
Join Category_wise_orders c 
On c.category = t.category
Order BY return_rate DESC;


-- Q181. Find payment mode preference by country.
WITH total_orders_by_payment AS (
Select c.country, o.payment_mode, 
Count(order_id) as total_orders
From orders o
Join customers c
On c.customer_id = o.customer_id
Group BY c.country, o.payment_mode),
Payment_mode_ranking AS (
Select country, payment_mode, total_orders,
DENSE_RANK() OVER(PARTITION BY country ORDER BY total_orders DESC) as payment_mode_preference
From total_orders_by_payment)
Select * from payment_mode_ranking
Where payment_mode_preference = 1;

-- Q182. Find high-value repeat customers.
WITH customer_order_count AS (
Select customer_id,
Count(order_id) as total_orders  From orders
Group BY customer_id
Having total_orders > 1
Order BY total_orders DESC ),
Total_sales_customer_wise AS (
Select o.customer_id, 
SUM(od.total_sales) as total_revenue
From order_details od
Join orders o On o.order_id = od.order_id
Group BY o.customer_id
Order BY total_revenue DESC) 
Select t.customer_id, c.total_orders, t.total_revenue
From total_sales_customer_wise t
Join customer_order_count c ON c.customer_id = t.customer_id 
Order BY total_revenue DESC ;


-- Q183. Find low-performing products.
WITH Product_performance AS (
Select p.product_id, p.product_name, 
Sum(od.total_sales) as total_revenue
From order_details od
Join products p 
On p.product_id = od.product_id
Group BY p.product_id, p.product_name )

Select product_id, product_name, total_revenue,
RANK() OVER(ORDER BY total_revenue DESC) as product_rank
From product_performance
ORDER BY product_rank DESC ;

-- Q184. Build sales KPI dashboard queries.
-- KPI 1: Total Revenue
-- What is the total revenue generated by the business?

Select SUM(total_sales) as total_revenue
From order_details;

-- KPI 2: Total Orders and Average Order Value
-- How many orders were placed and what is the average revenue per order?
Select COUNT(DISTINCT order_id) as total_orders
From orders;

-- avg_revenue_per_order
Select 
ROUND(SUM(total_sales)/ COUNT(DISTINCT order_id),2) 
as avg_order_value
From order_details;

-- KPI 3: Monthly Revenue Trend
-- Show revenue by month and identify month-over-month revenue changes.
WITH revenue_month AS (
Select YEAR(o.order_date) as order_year, 
       Month(o.order_date) as order_month, 
       SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
On o.order_id = od.order_id
GROUP BY order_year, order_month ),
previous_month_revenue AS (
Select order_year, order_month, total_revenue, 
LAG(total_revenue) OVER(ORDER BY order_year, order_month) as last_month_revenue
From revenue_month )
Select order_year, order_month, total_revenue, last_month_revenue,
Total_revenue - last_month_revenue AS revenue_difference
From previous_month_revenue
ORDER BY order_year, order_month;

-- KPI 4: Top 5 Customers by Revenue
-- Who are the top 5 customers contributing the most revenue?
Select c.customer_id, c.customer_name, 
Sum(od.total_sales) as total_revenue
From order_details od
JOIN orders o
ON o.order_id = od.order_id
JOIN customers c
On c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
Order BY total_revenue DESC 
LIMIT 5;

-- KPI 5: Best Performing Product Category
-- Rank product categories based on revenue generated.
WITH product_revenue AS (
Select  p.category, 
       SUM(total_sales) as total_revenue
       From order_details od
       Join products p 
       On p.product_id = od.product_id
Group BY p.category )

Select category, total_revenue,
RANK() OVER (ORDER BY total_revenue DESC) as product_rank
From product_revenue;

-- KPI 6: Return Rate Analysis -- Calculate return rate by product category.
WITH category_orders AS (
Select p.category, o.order_status,
COUNT(od.order_id) as overall_order_count
From order_details od
Join products p On p.product_id = od.product_id
Join orders o On o.order_id = od.order_id
Group BY p.category, o.order_status ), 
returned_orders AS (
Select category, 
SUM(overall_order_count) as total_orders
From category_orders
Group BY category)
Select co.category, co.order_status, co.overall_order_count, ro.total_orders, 
ROUND((overall_order_count *100 / total_orders),2) AS return_rate
FROM category_orders co
JOIN returned_orders ro ON co.category = ro.category
WHERE order_status = 'returned'
GROUP BY co.category, co.order_status, co.overall_order_count, ro.total_orders;


-- KPI 7: Customer Retention Indicator
-- Identify customers who have placed more than one order and calculate their lifetime value.

Select c.customer_id, c.customer_name, 
Count(DISTINCT o.order_id) as total_orders, Sum(od.total_sales) as total_sales
FROM order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
ON c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name
HAVING total_orders > 1 
Order BY total_orders DESC;

-- KPI 8: Payment Mode Preference by Country
WITH payment_mode_details AS (
Select c.country, o.payment_mode,
SUM(total_sales) as total_order_value
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
GROUP BY c.country, o.payment_mode ),
payment_mode_ranks AS (
Select country, payment_mode, total_order_value, 
RANK() OVER(PARTITION BY country ORDER BY total_order_value DESC) as payment_mode_rank
From payment_mode_details )
Select * from payment_mode_ranks
WHERE payment_mode_rank = 1
ORDER BY total_order_value DESC;

-- Q185. Find fastest growing category in 2024.
WITH category_wise_sales AS (
Select p.category, 
       YEAR(o.order_date) as order_year,
       MONTH(o.order_date) as order_month,
SUM(od.total_sales) as current_month_revenue
From order_details od
Join orders o
ON o.order_id = od.order_id
JOIN products p
ON p.product_id = od.product_id
GROUP BY p.category, order_year, order_month), 

previous_month_sales AS (
Select category, order_year, order_month, current_month_revenue, 
LAG(current_month_revenue) OVER(PARTITION BY category ORDER BY order_year,order_month) Previous_month_revenue
From category_wise_sales ),

revenue_difference AS (
Select category, order_year, order_month, current_month_revenue, previous_month_revenue, 
current_month_revenue - previous_month_revenue AS revenue_difference
From previous_month_sales)

Select * ,
RANK() OVER(ORDER BY revenue_difference DESC) as revenue_rank
FROM revenue_difference 
WHERE order_year = 2024;


-- Q186. Identify top 20% customers by revenue.
WITH customer_revenue AS (
Select c.customer_id, c.customer_name, 
Sum(od.total_sales) as total_revenue
From order_details od
Join orders o
On o.order_id = od.order_id
Join customers c
on c.customer_id = o.customer_id 
Group BY c.customer_id, c.customer_name), 
Customer_segment AS (
Select customer_id, customer_name, total_revenue,
NTILE(5) OVER(ORDER BY total_revenue DESC) as revenue_group
FROM customer_revenue )
Select *
From customer_segment 
Where revenue_group = 1;

-- Q187. Find customer retention rate.
With total_customers AS (
Select count(distinct customer_id) as total_customers
From customers ),
retained_customers AS (
Select customer_id 
From orders
Group BY customer_id
HAVING COUNT(DISTINCT order_id) > 1)
Select t.total_customers, 
COUNT(*) as retained_customers,
ROUND(COUNT(*) *100 / t.total_customers,2) as retention_rate
from retained_customers r
Cross JOIN total_customers t
Group BY t.total_customers;

-- Q188. Find average revenue per user.
Select o.customer_id,
ROUND(AVG(od.total_sales),2) as avg_revenue
FROM order_details od
Join orders o
On o.order_id = od.order_id
Group BY o.customer_id
ORDER BY avg_revenue DESC;

-- Q189. Find products with declining sales.
WITH product_sales AS (
Select p.product_id, p.product_name, 
       YEAR(o.order_date) as order_year, MONTH(o.order_date) as order_month,
SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
On o.order_id = od.order_id
Join products p
On p.product_id = od.product_id
Group BY p.product_id, p.product_name, order_year, order_month), 
product_rank AS ( SELECT product_id, product_name, order_year, order_month, total_revenue, 
LAG(total_revenue) OVER(PARTITION BY product_name ORDER BY order_year, order_month) as Previous_month_revenue
From product_sales ), 
declining_sales AS(
Select product_id, product_name, order_year, order_month, total_revenue, previous_month_revenue, 
total_revenue - previous_month_revenue AS revenue_difference
from product_rank)
Select * from declining_sales
Where order_year = 2024 AND revenue_difference < 0
Order BY product_name , order_month;

-- Q190. Identify best-selling category by country.
WITH total_revenue_by_country AS (
Select c.country, p.category, 
SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
ON o.order_id = od.order_id
JOIN customers c
On c.customer_id = o.customer_id
Join products p
ON p.product_id = od.product_id
GROUP BY c.country, p.category ),
Category_ranking AS (
Select country, category, total_revenue,
DENSE_RANK() OVER(PARTITION BY country ORDER BY total_revenue DESC) as category_rank
From total_revenue_by_country )
Select * from category_ranking
WHERE category_rank = 1;

-- Q191. Find countries with highest cancellations.
SELECT c.country,
       COUNT(*) AS total_cancelled_order_count
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Cancelled'
GROUP BY c.country
ORDER BY total_cancelled_order_count DESC;

-- Q192. Find revenue lost due to cancellations.
Select o.order_status, 
SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
ON o.order_id = od.order_id
Where order_status = 'cancelled'
Group BY o.order_status;

-- Q193. Find most profitable payment mode.
Select o.payment_mode, 
SUM(total_sales) as total_revenue
From order_details od
Join orders o
ON o.order_id = od.order_id
GROUP BY o.payment_mode
ORDER BY total_revenue DESC
Limit 1;

-- extra q: Find monthly customer revenue growth.
WITH customer_revenue AS (
Select c.customer_id, c.customer_name, 
	   Year(o.order_date) as order_year,
       Month(o.order_date) as order_month, 
       SUM(od.total_sales) as total_sales
From order_details od
JOIN orders o
On o.order_id = od.order_id
Join customers c
On c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name, order_year, order_month ), 

Previous_sales AS (
Select customer_id, customer_name, order_year, order_month, total_sales,
LAG(total_sales) OVER(PARTITION BY customer_id ORDER BY order_year, order_month ASC) AS Previous_sales
FROM customer_revenue),

Revenue_difference AS (
Select customer_id, customer_name, order_year, order_month, total_sales, previous_sales, 
total_sales - previous_sales AS customer_revenue_difference
FROM previous_sales)

Select * from revenue_difference
WHERE customer_revenue_difference > 0
ORDER BY customer_name, order_year, order_month ASC;

-- Q194. Find monthly customer growth.
WITH first_order AS (
    SELECT customer_id,
           MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id)
Select Year(first_order_date) as order_year,
	   Month(first_order_date) as order_month,
       COUNT(*) as new_customers
From first_order
Group BY order_year, order_month
Order By order_year ASC, order_month ASC;

-- Q195. Find product contribution percentage.
WITH product_wise_revenue AS (
Select p.product_name,
SUM(od.total_sales) as product_revenue
From order_details od
JOIN products p
ON p.product_id = od.product_id
Group BY p.product_name )

Select product_name, product_revenue, 
ROUND(product_revenue *100 /(Select SUM(total_sales) from order_details),2)  as revenue_contribution
From product_wise_revenue ;

-- Q196. Find revenue trend year-over-year.
WITH yearly_revenue AS (
Select YEAR(o.order_date) AS order_year, 
       SUM(total_sales) AS total_revenue
FROM order_details od
JOIN orders o
ON o.order_id = od.order_id
GROUP BY order_year ),

last_year_revenue AS (
Select order_year, total_revenue, 
LAG(total_revenue) OVER(ORDER BY order_year) as last_year_revenue
FROM yearly_revenue)

SELECT order_year, total_revenue, last_year_revenue, 
total_revenue - last_year_revenue AS revenue_difference_amount,
ROUND((total_revenue - last_year_revenue) / last_year_revenue *100,2) AS revenue_difference_percent
From last_year_revenue;


-- Q197. Find top-performing months.
WITH Month_wise_sales AS (
Select Year(o.order_date) as order_year, 
       Month(o.order_date) as order_month, 
       SUM(total_sales) as total_revenue
FROM order_details od
JOIN orders o
ON o.order_id = od.order_id
GROUP BY order_year, order_month )

Select order_year, order_month, total_revenue, 
DENSE_RANK() OVER(ORDER BY total_revenue DESC) as sales_ranking_month
FROM month_wise_sales
ORDER BY sales_ranking_month ASC;

-- Q198. Find most loyal customers.

Select c.customer_id, c.customer_name, 
COUNT(DISTINCT o.order_id) as customer_orders,
SUM(od.total_sales) as total_revenue
From order_details od
JOIN orders o
ON o.order_id = od.order_id
JOIN customers c
ON c.customer_id = o.customer_id
Group BY c.customer_id, c.customer_name
ORDER BY customer_orders DESC;

-- Q199. Find customers purchasing multiple categories.
	WITH total_revenue AS (
	Select c.customer_id, c.customer_name, p.category, 
	SUM(od.total_sales) as total_revenue
	From order_details od
	JOIN orders o
	On o.order_id = od.order_id
	Join products p
	ON p.product_id = od.product_id
	JOIN customers c
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name, p.category ) 
	SELECT customer_id, customer_name,
	COUNT(*) as category_count, 
	GROUP_concat(category ORDER BY category) as categories
	From total_revenue
	GROUP BY customer_id, customer_name
	HAVING COUNT(*) > 1;

-- Q200. Build executive business summary query.
WITH total_revenue AS (
SELECT SUM(total_sales) as total_revenue
From order_details ), 

total_orders AS (
SELECT COUNT(*) as total_orders
FROM orders ),

total_customers AS (
SELECT COUNT(*) as total_customers
From customers ),

avg_order_value AS (
Select ROUND(AVG(total_sales),2) AS avg_order_value
From order_details ),

return_rate AS (
SELECT ROUND(COUNT(CASE WHEN order_status='Returned' THEN 1 END)
           *100.0 / COUNT(*),2) AS return_rate
    FROM orders ), 

top_category AS (
Select p.category,
SUM(total_sales) as top_category
From order_details od
JOIN products p 
ON p.product_id = od.product_id
GROUP BY p.category 
ORDER BY top_category DESC 
LIMIT 1 ),

top_country AS (
Select c.country, 
SUM(total_sales) as top_country
From order_details od
JOIN orders o
ON o.order_id = od.order_id
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY top_country DESC
LIMIT 1 )

Select tr.total_revenue, 
        o.total_orders,
        tc.total_customers,
        ao.avg_order_value,
        rr.return_rate,	
        tpc.top_category,
        toc.top_country
From total_revenue tr
CROSS JOIN total_orders o 
CROSS JOIN total_customers tc
CROSS JOIN avg_order_value ao
CROSS JOIN return_rate rr
CROSS JOIN top_category tpc
CROSS JOIN top_country toc;
