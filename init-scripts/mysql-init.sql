-- ============================================================
-- MySQL Initialization Script
-- Sales Database - Products and Sales
-- Автор: Литвинов Никита Антонович, МИНДА 241
-- ============================================================

-- Use the sales database
USE sales_db;

-- Create categories table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    supplier VARCHAR(100),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    discount_percent DECIMAL(5, 2) DEFAULT 0,
    region VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert categories
INSERT INTO categories (category_name, description) VALUES
('Электроника', 'Электронные устройства и гаджеты'),
('Одежда', 'Мужская и женская одежда'),
('Бытовая техника', 'Техника для дома'),
('Спорт', 'Спортивные товары и инвентарь'),
('Книги', 'Печатные и электронные книги'),
('Косметика', 'Косметика и средства ухода');

-- Insert products
INSERT INTO products (product_name, category_id, price, stock_quantity, supplier) VALUES
('Смартфон Galaxy S24', 1, 75000.00, 150, 'TechSupply'),
('Ноутбук ASUS VivoBook', 1, 65000.00, 80, 'CompuTrade'),
('Наушники Sony WH-1000XM5', 1, 32000.00, 200, 'AudioPro'),
('Планшет iPad Air', 1, 58000.00, 100, 'AppleReseller'),
('Умные часы Apple Watch', 1, 42000.00, 120, 'AppleReseller'),
('Куртка зимняя', 2, 12000.00, 300, 'FashionWholesale'),
('Джинсы классические', 2, 4500.00, 500, 'DenimFactory'),
('Футболка премиум', 2, 2500.00, 800, 'CottonMills'),
('Кроссовки Nike Air Max', 2, 15000.00, 250, 'SportGear'),
('Пылесос Dyson V15', 3, 55000.00, 60, 'HomeAppliances'),
('Кофемашина DeLonghi', 3, 48000.00, 45, 'CoffeeEquip'),
('Микроволновка Samsung', 3, 12000.00, 90, 'HomeAppliances'),
('Беговая дорожка', 4, 85000.00, 25, 'FitnessPro'),
('Гантели наборные', 4, 18000.00, 100, 'SportGear'),
('Йога-коврик премиум', 4, 3500.00, 400, 'YogaSupplies'),
('Велосипед горный', 4, 45000.00, 40, 'BikeWorld'),
('Роман "1984" Оруэлл', 5, 650.00, 1000, 'BookDistrib'),
('Учебник Python', 5, 1800.00, 300, 'TechBooks'),
('Атлас мира', 5, 2200.00, 150, 'GeoPublishing'),
('Крем для лица', 6, 3200.00, 350, 'BeautySupply'),
('Шампунь профессиональный', 6, 1500.00, 600, 'HairCare'),
('Парфюм Chanel', 6, 12000.00, 80, 'PerfumeHouse');

-- Insert sales data (spanning multiple months for analysis)
INSERT INTO sales (product_id, sale_date, quantity, unit_price, discount_percent, region) VALUES
-- January 2024
(1, '2024-01-05', 5, 75000.00, 0, 'Москва'),
(3, '2024-01-07', 12, 32000.00, 5, 'Москва'),
(6, '2024-01-10', 25, 12000.00, 10, 'Санкт-Петербург'),
(8, '2024-01-12', 40, 2500.00, 0, 'Казань'),
(17, '2024-01-15', 80, 650.00, 0, 'Новосибирск'),
(20, '2024-01-18', 30, 3200.00, 5, 'Москва'),
(2, '2024-01-22', 3, 65000.00, 0, 'Екатеринбург'),
(9, '2024-01-25', 15, 15000.00, 0, 'Самара'),
-- February 2024
(1, '2024-02-02', 8, 75000.00, 5, 'Москва'),
(4, '2024-02-05', 4, 58000.00, 0, 'Санкт-Петербург'),
(10, '2024-02-08', 2, 55000.00, 0, 'Москва'),
(11, '2024-02-12', 3, 48000.00, 10, 'Казань'),
(14, '2024-02-15', 10, 18000.00, 0, 'Самара'),
(7, '2024-02-18', 55, 4500.00, 15, 'Ростов'),
(18, '2024-02-22', 45, 1800.00, 0, 'Москва'),
(21, '2024-02-28', 60, 1500.00, 5, 'Санкт-Петербург'),
-- March 2024
(5, '2024-03-03', 10, 42000.00, 0, 'Москва'),
(3, '2024-03-08', 18, 32000.00, 10, 'Казань'),
(12, '2024-03-12', 8, 12000.00, 0, 'Новосибирск'),
(15, '2024-03-15', 35, 3500.00, 0, 'Екатеринбург'),
(16, '2024-03-20', 5, 45000.00, 5, 'Москва'),
(22, '2024-03-25', 12, 12000.00, 0, 'Санкт-Петербург'),
(6, '2024-03-28', 30, 12000.00, 15, 'Самара'),
-- April 2024
(1, '2024-04-02', 12, 75000.00, 10, 'Москва'),
(2, '2024-04-06', 6, 65000.00, 5, 'Санкт-Петербург'),
(13, '2024-04-10', 2, 85000.00, 0, 'Москва'),
(9, '2024-04-14', 20, 15000.00, 5, 'Казань'),
(8, '2024-04-18', 65, 2500.00, 0, 'Ростов'),
(17, '2024-04-22', 120, 650.00, 10, 'Новосибирск'),
(20, '2024-04-28', 45, 3200.00, 0, 'Москва'),
-- May 2024
(4, '2024-05-03', 7, 58000.00, 0, 'Екатеринбург'),
(5, '2024-05-08', 15, 42000.00, 5, 'Москва'),
(10, '2024-05-12', 4, 55000.00, 0, 'Санкт-Петербург'),
(11, '2024-05-16', 5, 48000.00, 5, 'Самара'),
(14, '2024-05-20', 18, 18000.00, 10, 'Казань'),
(19, '2024-05-25', 25, 2200.00, 0, 'Москва'),
(7, '2024-05-30', 70, 4500.00, 10, 'Ростов'),
-- June 2024
(1, '2024-06-04', 15, 75000.00, 0, 'Москва'),
(3, '2024-06-08', 25, 32000.00, 5, 'Санкт-Петербург'),
(6, '2024-06-12', 40, 12000.00, 20, 'Новосибирск'),
(16, '2024-06-16', 8, 45000.00, 0, 'Казань'),
(22, '2024-06-20', 20, 12000.00, 10, 'Москва'),
(21, '2024-06-25', 75, 1500.00, 0, 'Екатеринбург'),
(18, '2024-06-30', 55, 1800.00, 5, 'Самара');

-- Create indexes for performance
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_product ON sales(product_id);
CREATE INDEX idx_products_category ON products(category_id);
