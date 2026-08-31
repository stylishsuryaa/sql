-- ===================================================
-- CASE STUDY: E-Commerce Database Management System
-- Engine: MySQL
-- ===================================================

DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 1. Table Creation with Relational Integrity
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    status ENUM('PENDING', 'PROCESSING', 'SHIPPED', 'DELIVERED', 'CANCELLED') DEFAULT 'PENDING',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 2. Mock Data Insertion
INSERT INTO categories (category_name) VALUES ('Electronics'), ('Apparel'), ('Home');

INSERT INTO customers (first_name, last_name, email) VALUES 
('Suryaa', 'Subbaraj', 'suryaa@example.com'),
('Anitha', 'Vasudevan', 'anitha@example.com'),
('Karthik', 'Raja', 'karthik@example.com');

INSERT INTO products (product_name, price, stock_quantity, category_id) VALUES 
('Mechanical Keyboard', 4500.00, 25, 1),
('Wireless Mouse', 1200.00, 50, 1),
('Cotton T-Shirt', 699.00, 100, 2),
('Coffee Mug', 299.00, 80, 3);

INSERT INTO orders (customer_id, total_amount, status) VALUES 
(1, 5700.00, 'DELIVERED'),
(2, 699.00, 'PROCESSING'),
(1, 1200.00, 'SHIPPED');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 4500.00),
(1, 2, 1, 1200.00),
(2, 3, 1, 699.00),
(3, 2, 1, 1200.00);

-- 3. Complex Analytical Queries

-- Report: Total revenue and items bought per customer
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(SUM(oi.quantity), 0) AS total_items_purchased,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0.00) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY lifetime_value DESC;

-- Subquery: Find products priced higher than the average product price in their category
SELECT 
    p.product_name, 
    p.price, 
    c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.price > (
    SELECT AVG(p2.price) 
    FROM products p2 
    WHERE p2.category_id = p.category_id
);
