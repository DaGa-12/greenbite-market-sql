-- GreenBite Market
-- Data loading script
-- Run this script after database_setup.sql.

USE greenbite_market_test;

-- Independent data
INSERT INTO categories (category_id, category_name)
VALUES
    (1, 'Beverages'),
    (2, 'Snacks'), 
    (3, 'Grains'),
    (4, 'Dairy'),
    (5, 'Cleaning');

INSERT INTO branches (sucursal_id, nombre_sucursal, ciudad)
VALUES
    (1, 'GreenBite Centro', 'San José'),
    (2, 'GreenBite Heredia', 'Heredia'),
    (3, 'GreenBite Escazú', 'Escazú'),
    (4, 'GreenBite Alajuela', 'Alajuela');

INSERT INTO customer (customer_id, customer_name, city)
VALUES
    (1001, 'Ana Pérez', 'San José'),
    (1002, 'Carlos Gómez', 'Heredia'),
    (1003, 'María López', 'Escazú'),
    (1004, 'José Ramírez', 'Alajuela'),
    (1005, 'Daniela Soto', 'San José'),
    (1006, 'Luis Arias', 'Heredia'),
    (1007, 'Valeria Cruz', 'Escazú'),
    (1008, 'Pablo Méndez', 'Alajuela'),
    (1009, 'Natalia Ruiz', 'San José'),
    (1010, 'Fernando León', 'Heredia');


-- Data with foreign-key dependencies
INSERT INTO employees (employee_id, name, lastname, branch_id)
VALUES
    (101, 'Laura', 'Mora', 1),
    (102, 'Diego', 'Rojas', 1),
    (103, 'Sofía', 'Castro', 2),
    (104, 'Andrés', 'Vargas', 2),
    (105, 'Camila', 'Solís', 3),
    (106, 'Marco', 'Jiménez', 4);

INSERT INTO products (product_id, product_name, category_id, unit_price)
VALUES
    (201, 'Ground Coffee 500g', 1, 5.50),
    (202, 'Green Tea 20 Bags', 1, 3.75),
    (203, 'Natural Granola 400g', 2, 4.25),
    (204, 'Whole Grain Cookies', 2, 2.80),
    (205, 'Brown Rice 1kg', 3, 3.60),
    (206, 'Black Beans 500g', 3, 2.95),
    (207, 'Plain Yogurt 1L', 4, 4.10),
    (208, 'Semi-Skimmed Milk 1L', 4, 2.35),
    (209, 'Liquid Soap 500ml', 5, 3.90),
    (210, 'Biodegradable Detergent 1kg', 5, 6.75);

INSERT INTO sales (sale_id, sale_date, branch_id, employee_id, customer_id)
VALUES
    (5001, '2026-08-01', 1, 101, 1001),
    (5002, '2026-08-01', 2, 103, 1002),
    (5003, '2026-08-02', 3, 105, 1003),
    (5004, '2026-08-02', 4, 106, 1004),
    (5005, '2026-08-03', 1, 102, 1005),
    (5006, '2026-08-03', 2, 104, 1006),
    (5007, '2026-08-04', 3, 105, 1007),
    (5008, '2026-08-04', 4, 106, 1008),
    (5009, '2026-08-05', 1, 101, 1009),
    (5010, '2026-08-05', 2, 103, 1010),
    (5011, '2026-08-06', 1, 102, 1001),
    (5012, '2026-08-06', 3, 105, 1003),
    (5013, '2026-08-07', 2, 104, 1002),
    (5014, '2026-08-07', 4, 106, 1004),
    (5015, '2026-08-08', 1, 101, 1005),
    (5016, '2026-08-08', 3, 105, 1007);

INSERT INTO sales_details (detail_id, sale_id, product_id, quantity)
VALUES
    (1, 5001, 201, 2),
    (2, 5001, 203, 1),
    (3, 5002, 205, 3),
    (4, 5002, 208, 2),
    (5, 5003, 210, 2),
    (6, 5003, 204, 3),
    (7, 5004, 207, 2),
    (8, 5004, 206, 2),
    (9, 5005, 201, 3),
    (10, 5005, 202, 2),
    (11, 5006, 203, 4),
    (12, 5006, 209, 1),
    (13, 5007, 210, 3),
    (14, 5007, 207, 2),
    (15, 5008, 205, 2),
    (16, 5008, 206, 3),
    (17, 5009, 201, 1),
    (18, 5009, 203, 3),
    (19, 5010, 208, 4),
    (20, 5010, 204, 2),
    (21, 5011, 202, 3),
    (22, 5011, 207, 2),
    (23, 5012, 210, 1),
    (24, 5012, 209, 2),
    (25, 5013, 205, 4),
    (26, 5013, 203, 2),
    (27, 5014, 208, 3),
    (28, 5014, 206, 2),
    (29, 5015, 201, 2),
    (30, 5015, 210, 1),
    (31, 5016, 207, 3),
    (32, 5016, 204, 2);
    
    