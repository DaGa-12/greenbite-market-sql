-- GreenBite Market
-- Data analysis and business questions
-- Run this script after data_insertion.sql to analyze the loaded data.

USE greenbite_market;

-- 1. Which products belong to each product category?
SELECT p.product_id, p.product_name, c.category_name

FROM products as p
JOIN categories as c ON p.category_id = c.category_id;

-- 2. How are employees distributed across the different branches?
SELECT e.employee_id, e.name, e.lastname, b.branch_name, b.city

FROM employees as e
JOIN branches as b ON e.branch_id = b.branch_id;

-- 3. Which branches have employees assigned to them, including branches with no employees?
SELECT b.branch_id, b.branch_name, e.name, e.lastname

FROM branches as b
LEFT JOIN employees as e ON b.branch_id = e.branch_id;

-- 4. Which customer, employee, and branch are associated with each sale?
SELECT s.sale_id, c.customer_name, e.employee_id, e.name, e.lastname, b.branch_name

FROM sales as s
LEFT JOIN customers as c ON s.customer_id = c.customer_id
LEFT JOIN employees as e ON s.employee_id = e.employee_id
LEFT JOIN branches as b ON s.branch_id = b.branch_id;

-- 5. What information is associated with a specific customer ID?
SELECT *
FROM customers
WHERE customer_id = 1007;

-- 6. How much does each customer spend, and how many purchases do they make?
SELECT c.customer_id, c.customer_name, 
TRUNCATE(SUM(p.unit_price * sd.quantity), 2)AS total_spent,
COUNT(DISTINCT s.sale_id) AS purchase_count

FROM customers as c
JOIN sales as s ON c.customer_id = s.customer_id
JOIN sales_details as sd ON s.sale_id = sd.sale_id
JOIN products as p ON sd.product_id = p.product_id

GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 7. Which products have sold the highest number of units?
SELECT p.product_id, p.product_name, SUM(sd.quantity) AS quantity_total

FROM sales as s 
JOIN sales_details as sd ON s.sale_id = sd.sale_id
JOIN products as p ON sd.product_id = p.product_id

GROUP BY p.product_id, p.product_name
ORDER BY quantity_total, p.product_id DESC;

-- 8. Which product categories generate the highest sales revenue?
SELECT c.category_id, c.category_name, 
TRUNCATE(SUM(p.unit_price * sd.quantity), 2) as total_sales

FROM sales_details as sd   
JOIN products as p ON sd.product_id = p.product_id
JOIN categories as c ON p.category_id = c.category_id

GROUP BY c.category_id, c.category_name
ORDER BY total_sales DESC
LIMIT 4;

-- 9. How does total sales revenue compare across branches?
SELECT b.branch_id, b.branch_name, 
TRUNCATE(SUM(p.unit_price * sd.quantity), 2) AS total_sales

FROM sales as s
JOIN branches as b ON s.branch_id = b.branch_id
JOIN sales_details as sd ON s.sale_id = sd.sale_id
JOIN products as p ON sd.product_id = p.product_id

GROUP BY b.branch_id, b.branch_name
ORDER BY total_sales DESC
;

-- 10. What is the average value of a customer purchase?
WITH customer_purchase AS (
	SELECT
		c.customer_id, c.customer_name, s.sale_id,
        SUM(p.unit_price * sd.quantity) AS total_sales
	FROM sales as s
	JOIN customers as c ON s.customer_id = c.customer_id
	JOIN sales_details as sd ON s.sale_id = sd.sale_id
	JOIN products as p ON sd.product_id = p.product_id
    
	GROUP BY c.customer_id, c.customer_name, s.sale_id
    )

SELECT customer_id, customer_name, TRUNCATE(
AVG(total_sales), 2) as average_purchase_value

FROM customer_purchase 

GROUP BY customer_id, customer_name
ORDER BY customer_id DESC;

