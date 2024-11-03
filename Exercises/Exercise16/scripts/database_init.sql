-- Script to create a MySQL table for simulating orders in an e-commerce

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Create the 'orders' table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery') NOT NULL,
    shipping_address VARCHAR(255) NOT NULL
);

-- Insert 50 random records into the 'orders' table
INSERT INTO orders (customer_id, order_date, status, total_amount, payment_method, shipping_address)
VALUES
(1, '2024-10-01 10:15:00', 'Pending', 100.50, 'Credit Card', '123 Main St, City A'),
(2, '2024-10-02 12:45:00', 'Shipped', 200.00, 'PayPal', '456 Oak St, City B'),
(3, '2024-10-03 14:30:00', 'Delivered', 150.75, 'Bank Transfer', '789 Pine St, City C'),
(4, '2024-10-04 09:20:00', 'Cancelled', 75.00, 'Cash on Delivery', '321 Elm St, City D'),
(5, '2024-10-05 11:00:00', 'Pending', 250.40, 'Credit Card', '987 Maple St, City E'),
(6, '2024-10-06 13:10:00', 'Shipped', 175.20, 'PayPal', '654 Willow St, City F'),
(7, '2024-10-07 15:50:00', 'Delivered', 130.90, 'Bank Transfer', '852 Birch St, City G'),
(8, '2024-10-08 10:40:00', 'Cancelled', 55.30, 'Credit Card', '159 Cedar St, City H'),
(9, '2024-10-09 16:30:00', 'Pending', 305.00, 'PayPal', '753 Spruce St, City I'),
(10, '2024-10-10 14:15:00', 'Shipped', 89.99, 'Cash on Delivery', '951 Cherry St, City J'),
(11, '2024-10-11 11:30:00', 'Delivered', 180.75, 'Credit Card', '456 Beech St, City K'),
(12, '2024-10-12 13:00:00', 'Pending', 220.50, 'PayPal', '789 Aspen St, City L'),
(13, '2024-10-13 14:45:00', 'Shipped', 310.20, 'Bank Transfer', '123 Oak St, City M'),
(14, '2024-10-14 09:25:00', 'Cancelled', 65.50, 'Cash on Delivery', '321 Maple St, City N'),
(15, '2024-10-15 12:40:00', 'Delivered', 405.30, 'Credit Card', '789 Pine St, City O'),
(16, '2024-10-16 11:15:00', 'Pending', 120.10, 'PayPal', '654 Willow St, City P'),
(17, '2024-10-17 13:30:00', 'Shipped', 270.60, 'Bank Transfer', '852 Birch St, City Q'),
(18, '2024-10-18 15:20:00', 'Cancelled', 95.80, 'Credit Card', '159 Cedar St, City R'),
(19, '2024-10-19 16:50:00', 'Pending', 350.99, 'PayPal', '753 Spruce St, City S'),
(20, '2024-10-20 10:35:00', 'Shipped', 88.49, 'Cash on Delivery', '951 Cherry St, City T'),
(21, '2024-10-21 12:00:00', 'Delivered', 199.95, 'Credit Card', '123 Elm St, City U'),
(22, '2024-10-22 14:10:00', 'Pending', 290.25, 'PayPal', '456 Oak St, City V'),
(23, '2024-10-23 11:45:00', 'Shipped', 310.70, 'Bank Transfer', '789 Cedar St, City W'),
(24, '2024-10-24 10:00:00', 'Cancelled', 80.60, 'Cash on Delivery', '321 Maple St, City X'),
(25, '2024-10-25 15:55:00', 'Delivered', 435.90, 'Credit Card', '789 Beech St, City Y'),
(26, '2024-10-26 13:30:00', 'Pending', 115.20, 'PayPal', '654 Pine St, City Z'),
(27, '2024-10-27 14:20:00', 'Shipped', 275.99, 'Bank Transfer', '852 Cedar St, City AA'),
(28, '2024-10-28 16:10:00', 'Cancelled', 110.80, 'Credit Card', '159 Elm St, City AB'),
(29, '2024-10-29 11:35:00', 'Pending', 370.50, 'PayPal', '753 Beech St, City AC'),
(30, '2024-10-30 12:20:00', 'Shipped', 92.99, 'Cash on Delivery', '951 Willow St, City AD'),
(31, '2024-10-31 13:40:00', 'Delivered', 185.45, 'Credit Card', '123 Cherry St, City AE'),
(32, '2024-11-01 15:00:00', 'Pending', 135.99, 'PayPal', '456 Spruce St, City AF'),
(33, '2024-11-02 16:30:00', 'Shipped', 310.30, 'Bank Transfer', '789 Aspen St, City AG'),
(34, '2024-11-03 10:10:00', 'Cancelled', 120.55, 'Cash on Delivery', '321 Oak St, City AH'),
(35, '2024-11-04 11:25:00', 'Delivered', 450.15, 'Credit Card', '789 Maple St, City AI'),
(36, '2024-11-05 14:05:00', 'Pending', 205.70, 'PayPal', '654 Cedar St, City AJ'),
(37, '2024-11-06 13:45:00', 'Shipped', 315.25, 'Bank Transfer', '852 Birch St, City AK'),
(38, '2024-11-07 16:10:00', 'Cancelled', 98.00, 'Credit Card', '159 Beech St, City AL'),
(39, '2024-11-08 15:40:00', 'Pending', 360.45, 'PayPal', '753 Elm St, City AM'),
(40, '2024-11-09 12:15:00', 'Shipped', 93.60, 'Cash on Delivery', '951 Pine St, City AN'),
(41, '2024-11-10 11:35:00', 'Delivered', 195.85, 'Credit Card', '123 Willow St, City AO'),
(42, '2024-11-11 13:50:00', 'Pending', 285.00, 'PayPal', '456 Cherry St, City AP'),
(43, '2024-11-12 10:45:00', 'Shipped', 330.40, 'Bank Transfer', '789 Spruce St, City AQ'),
(44, '2024-11-13 16:25:00', 'Cancelled', 100.20, 'Cash on Delivery', '321 Aspen St, City AR'),
(45, '2024-11-14 14:20:00', 'Delivered', 415.60, 'Credit Card', '789 Oak St, City AS');

GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'mysqluser';
