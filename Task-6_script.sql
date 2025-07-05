-- Create database
CREATE DATABASE IF NOT EXISTS productsdb;
USE productsdb;

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Lip Products'),
(2, 'Blushes'),
(3, 'Perfumes');

-- Insert data into products
INSERT INTO products (product_id, product_name, category_id, price) VALUES
(101, 'Rhode Peptide Lip Treatment', 1, 1537.02),
(102, 'Clarins Lip Oil', 1, 2200),
(103, 'Rare Beauty Liquid Blush', 2, 2560),
(104, 'YSL Libre Le Parfum', 3, 12500),
(105, 'Clinique Black Honey Lipstick', 1, 2200);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, total_amount, sale_date) VALUES
(1, 101, 2, 3074.04, '2025-07-01'),
(2, 102, 2, 4400, '2025-07-02'),
(3, 103, 4, 10240, '2025-07-03'),
(4, 104, 1, 12500, '2025-07-04'),
(5, 105, 3, 6600, '2025-07-05'),
(6, 101, 5, 7685.1, '2025-07-06');
