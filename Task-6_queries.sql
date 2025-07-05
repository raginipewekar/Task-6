-- Use your database
USE productsdb;

-- 1. Subquery in SELECT:
-- List each product with the total quantity sold
SELECT 
    product_name,
    (SELECT SUM(quantity) 
     FROM sales 
     WHERE sales.product_id = products.product_id) AS total_quantity_sold
FROM products;

-- 2. Subquery in WHERE:
-- Show products with above-average revenue, only product names, sorted descending
SELECT 
    p.product_name
FROM (
    SELECT 
        product_id,
        SUM(total_amount) AS total_revenue
    FROM sales
    GROUP BY product_id
) AS product_sales
JOIN products p ON p.product_id = product_sales.product_id
WHERE product_sales.total_revenue > (
    SELECT AVG(total_amount) FROM sales
)
ORDER BY product_sales.total_revenue DESC;

-- 3. Subquery in FROM:
-- Show total sales amount by category using a derived table
SELECT 
    category_name, 
    SUM(total_amount) AS total_sales
FROM (
    SELECT c.category_name, s.total_amount
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
) AS sales_with_category
GROUP BY category_name;

-- 4. Correlated Subquery:
-- List product names where the price is greater than the average price of other products in the same category
SELECT p1.product_name
FROM products p1
WHERE price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
      AND p2.product_id != p1.product_id
);