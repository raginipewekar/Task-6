# Task 6 – Subqueries and Nested Queries

This task demonstrates the use of **scalar**, **correlated**, and **nested subqueries** in MySQL using a custom `productsdb` database for a product sales scenario.

---

## 📁 Files Included

- `Task-6_script.sql` – Script to create and populate the database
- `Task-6_queries.sql` – SQL queries demonstrating subquery techniques
- `README.md` – This documentation file

---


## 🗃️ Database Overview

The database consists of three tables (📷 *Refer to screenshots for exact table structures and sample data.*):

- `categories`: stores product category names.
<img width="150" alt="image" src="https://github.com/user-attachments/assets/acaa27dd-deab-4d5f-b528-0a8a12c87827" />

- `products`: contains product details, including category and price.
<img width="301" alt="image" src="https://github.com/user-attachments/assets/ca39c6bf-6c15-4590-bf05-c70f6d23583a" />

- `sales`: tracks individual product sales including quantity and total amount.
<img width="283" alt="image" src="https://github.com/user-attachments/assets/5fd441ba-f06c-4ad8-ab27-28e03eee97dd" />


---

## ⚙️ Query Logic & Objectives

### 1️⃣ Subquery in `SELECT`
**Goal:** Show each product along with its total quantity sold  
**Logic:** A scalar subquery calculates `SUM(quantity)` from `sales` for each `product_id`.

<img width="232" alt="image" src="https://github.com/user-attachments/assets/35aaad3f-e5c1-4cc1-a1f6-4bc7e67c8a29" />

---

### 2️⃣ Subquery in `WHERE` with Sorting
**Goal:** List product names with revenue higher than the average revenue of all products, sorted in descending order  
**Logic:** A derived table in `FROM` calculates total revenue per product, which is then filtered and ordered.

<img width="153" alt="image" src="https://github.com/user-attachments/assets/f0d1559e-71be-4a28-aee3-51797eddeeaf" />

---

### 3️⃣ Subquery in `FROM`
**Goal:** Show total sales grouped by product category  
**Logic:** A subquery joins `sales`, `products`, and `categories`, then groups by category and sums up the total amount.

<img width="154" alt="image" src="https://github.com/user-attachments/assets/84016b60-07fd-4c56-9ddb-748063821ec5" />

---

### 4️⃣ Correlated Subquery
**Goal:** Show products priced above the average price of other products in the same category  
**Logic:** For each product, a correlated subquery calculates the average price (excluding itself) for the same category.

<img width="148" alt="image" src="https://github.com/user-attachments/assets/f2445d7c-fb33-4e7a-b350-7e45c6ca2f37" />
