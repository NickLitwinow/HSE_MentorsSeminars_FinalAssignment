-- ============================================================
-- PostgreSQL Initialization Script
-- Analytics Database - Orders and Customers
-- Автор: Литвинов Никита Антонович, МИНДА 241
-- ============================================================

-- Create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    city VARCHAR(100),
    country VARCHAR(50),
    registration_date DATE,
    segment VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20),
    payment_method VARCHAR(50),
    shipping_cost DECIMAL(10, 2)
);

-- Insert sample customers
INSERT INTO customers (customer_name, email, city, country, registration_date, segment) VALUES
('Иванов Петр', 'ivanov@example.com', 'Москва', 'Россия', '2023-01-15', 'Premium'),
('Смирнова Анна', 'smirnova@example.com', 'Санкт-Петербург', 'Россия', '2023-02-20', 'Standard'),
('Козлов Дмитрий', 'kozlov@example.com', 'Новосибирск', 'Россия', '2023-03-10', 'Premium'),
('Новикова Елена', 'novikova@example.com', 'Казань', 'Россия', '2023-04-05', 'Standard'),
('Морозов Алексей', 'morozov@example.com', 'Москва', 'Россия', '2023-05-12', 'VIP'),
('Волкова Мария', 'volkova@example.com', 'Екатеринбург', 'Россия', '2023-06-18', 'Standard'),
('Соловьев Андрей', 'soloviev@example.com', 'Самара', 'Россия', '2023-07-22', 'Premium'),
('Павлова Ольга', 'pavlova@example.com', 'Омск', 'Россия', '2023-08-30', 'Standard'),
('Семенов Игорь', 'semenov@example.com', 'Челябинск', 'Россия', '2023-09-14', 'VIP'),
('Голубева Наталья', 'golubeva@example.com', 'Москва', 'Россия', '2023-10-25', 'Premium'),
('Виноградов Сергей', 'vinogradov@example.com', 'Воронеж', 'Россия', '2023-11-08', 'Standard'),
('Богданова Татьяна', 'bogdanova@example.com', 'Красноярск', 'Россия', '2023-12-01', 'Premium'),
('Воробьев Николай', 'vorobiev@example.com', 'Пермь', 'Россия', '2024-01-10', 'Standard'),
('Федорова Светлана', 'fedorova@example.com', 'Нижний Новгород', 'Россия', '2024-02-15', 'VIP'),
('Михайлов Владимир', 'mikhailov@example.com', 'Ростов-на-Дону', 'Россия', '2024-03-20', 'Premium');

-- Insert sample orders (spanning multiple months for time-series analysis)
INSERT INTO orders (customer_id, order_date, amount, status, payment_method, shipping_cost) VALUES
-- January 2024
(1, '2024-01-05', 15000.00, 'Completed', 'Card', 500.00),
(2, '2024-01-08', 8500.50, 'Completed', 'Cash', 350.00),
(3, '2024-01-12', 22000.00, 'Completed', 'Card', 0.00),
(4, '2024-01-15', 5600.00, 'Completed', 'Transfer', 250.00),
(5, '2024-01-20', 45000.00, 'Completed', 'Card', 0.00),
(1, '2024-01-25', 12000.00, 'Completed', 'Card', 400.00),
-- February 2024
(6, '2024-02-02', 7800.00, 'Completed', 'Cash', 300.00),
(7, '2024-02-08', 18500.00, 'Completed', 'Card', 0.00),
(8, '2024-02-14', 9200.00, 'Completed', 'Transfer', 350.00),
(9, '2024-02-18', 52000.00, 'Completed', 'Card', 0.00),
(10, '2024-02-22', 14300.00, 'Completed', 'Card', 450.00),
(2, '2024-02-28', 6700.00, 'Completed', 'Cash', 280.00),
-- March 2024
(11, '2024-03-05', 11200.00, 'Completed', 'Card', 400.00),
(12, '2024-03-10', 25000.00, 'Completed', 'Card', 0.00),
(13, '2024-03-15', 4500.00, 'Completed', 'Cash', 200.00),
(14, '2024-03-20', 38000.00, 'Completed', 'Transfer', 0.00),
(15, '2024-03-25', 16800.00, 'Completed', 'Card', 500.00),
(3, '2024-03-28', 19500.00, 'Completed', 'Card', 0.00),
-- April 2024
(1, '2024-04-02', 21000.00, 'Completed', 'Card', 0.00),
(5, '2024-04-08', 48000.00, 'Completed', 'Card', 0.00),
(9, '2024-04-12', 55000.00, 'Completed', 'Transfer', 0.00),
(7, '2024-04-18', 23000.00, 'Completed', 'Card', 600.00),
(10, '2024-04-22', 17500.00, 'Completed', 'Card', 500.00),
(4, '2024-04-28', 8900.00, 'Completed', 'Cash', 320.00),
-- May 2024
(6, '2024-05-04', 12500.00, 'Completed', 'Card', 450.00),
(8, '2024-05-10', 7300.00, 'Completed', 'Transfer', 300.00),
(11, '2024-05-15', 19800.00, 'Completed', 'Card', 0.00),
(13, '2024-05-20', 6200.00, 'Completed', 'Cash', 250.00),
(14, '2024-05-25', 41000.00, 'Completed', 'Card', 0.00),
(12, '2024-05-30', 28500.00, 'Completed', 'Card', 0.00),
-- June 2024
(2, '2024-06-03', 9800.00, 'Completed', 'Cash', 350.00),
(15, '2024-06-08', 22000.00, 'Completed', 'Card', 0.00),
(1, '2024-06-12', 31000.00, 'Completed', 'Card', 0.00),
(5, '2024-06-18', 62000.00, 'Completed', 'Transfer', 0.00),
(9, '2024-06-22', 47000.00, 'Completed', 'Card', 0.00),
(3, '2024-06-28', 24500.00, 'Pending', 'Card', 550.00),
-- Additional orders for variety
(7, '2024-07-05', 15600.00, 'Pending', 'Card', 480.00),
(10, '2024-07-12', 18200.00, 'Processing', 'Transfer', 0.00),
(4, '2024-07-18', 7400.00, 'Completed', 'Cash', 290.00);

-- Create index for faster date-based queries
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer ON orders(customer_id);
