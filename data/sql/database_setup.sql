-- GreenBite Market
-- Database structure
-- Recreates the database and its relational schema from scratch.
-- Uncomment the line below to delete an existing database with the same name
-- before creating a new one.

-- DROP DATABASE IF EXISTS greenbite_market;

CREATE DATABASE greenbite_market
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE greenbite_market;

-- Independent tables
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Tables dependent on the independent tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    branch_id INT NOT NULL,
    CONSTRAINT fk_empleados_sucursal
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name_producto VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    date_sale DATE NOT NULL,
    branch_id INT NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT fk_sales_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id),
    CONSTRAINT fk_sales_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),
    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE sales_details (
    detail_id INT PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_detail_sale
        FOREIGN KEY (sale_id)
        REFERENCES sale(sale_id),
    CONSTRAINT fk_detail_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- Table creation order follows the foreign-key dependencies:
-- branches, customers, categories
-- -> employees, products
-- -> sales
-- -> sales_detail

