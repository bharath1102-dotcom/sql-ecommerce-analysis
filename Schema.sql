-- Create Tables

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name TEXT,
city TEXT,
country TEXT,
signup_date DATE
);

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name TEXT,
category TEXT,
price NUMERIC
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE
);

CREATE TABLE order_items(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY,
order_id INT,
payment_amount NUMERIC,
payment_method TEXT
);