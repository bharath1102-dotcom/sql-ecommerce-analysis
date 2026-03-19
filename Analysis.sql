-- ====================
-- 1. BASIC METRICS
-- ====================

--Total customers
SELECT COUNT(*) AS Total_customers
FROM customers;

--Total products
SELECT COUNT(*) AS Total_products
FROM products;

--Total orders
SELECT COUNT(*) AS Total_orders
FROM orders;

--Total revenue
SELECT SUM(payment_amount) AS Total_revenue
FROM payments;

--Average order value
SELECT ROUND(AVG(payment_amount)) AS Average_order_value
FROM payments;

-- ====================
-- 2. ANALYSIS
-- ====================

--Best selling products
SELECT p.product_name, SUM(oi.quantity) AS Total_sold
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY Total_sold DESC;

--Sales by category
SELECT pr.category, SUM(oi.quantity * pr.price) AS total_sales
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.category
ORDER BY total_sales DESC;

--Most popular category
SELECT pr.category, SUM(oi.quantity) AS total_items_sold
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.category
ORDER BY total_items_sold DESC
LIMIT 1;

--Orders by payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM payments
GROUP BY payment_method
ORDER BY total_orders DESC;

--Orders per customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

--Monthly revenue trend
SELECT DATE_TRUNC('month', o.order_date) AS month, SUM(p.payment_amount) AS revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

--Top three customers
SELECT *
FROM (
    SELECT 
    c.customer_name,
    SUM(p.payment_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.payment_amount) DESC) AS rank
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN payments p ON o.order_id = p.order_id
    GROUP BY c.customer_name
) ranked
WHERE rank <= 3;

--Product ranking
SELECT p.product_name, SUM(oi.quantity) AS total_sold,
RANK() OVER (ORDER BY SUM(oi.quantity) DESC) AS rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

--Running total revenue
SELECT o.order_date, SUM(p.payment_amount) AS daily_revenue,
SUM(SUM(p.payment_amount)) OVER (ORDER BY o.order_date) AS running_total
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

--Customer value analysis
SELECT c.customer_name, SUM(p.payment_amount) AS total_spent,
CASE 
    WHEN SUM(p.payment_amount) > 50000 THEN 'High Value'
    WHEN SUM(p.payment_amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_name;








