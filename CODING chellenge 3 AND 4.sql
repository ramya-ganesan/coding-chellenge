CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);


SELECT
	product_id, 
    product_name, 
    price
FROM product
ORDER BY price DESC
LIMIT 3;

SELECT COUNT(*) AS total_sales_record
FROM sales;

SELECT SUM(sale_amount) as total_sales_amount
FROM SALES;

SELECT ROUND(AVG(sale_amount),2) as AVG_sales_amount
FROM SALES;

SELECT max(sale_amount) as highest_sales_amount
FROM SALES;

SELECT MIN(sale_amount) as lowest_sales_amount
FROM SALES;



SELECT 
    department_id,
    COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT 
	product_id,
    SUM(sale_amount) AS TOTAL_SALES_AMOUNT
FROM sales
GROUP BY product_id
HAVING sum(sale_amount) > 100;

SELECT
    product_id,
    product_name,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM 
    product;

SELECT 
	product_id,
    product_name,
    price
FROM product
ORDER BY product_id asc
LIMIT 3;

SELECT 
	p.product_id,
	p.product_name,
    sum(s.sale_amount) as total_sales
FROM product p
join sales s on p.product_id = s.product_id
group BY 
	p.product_id,
	p.product_name
HAVING SUM(s.sale_amount) >50000;

SELECT 
	p.product_id,
	p.product_name,
    sum(s.sale_amount) as total_sales
FROM product p
join sales s on p.product_id = s.product_id
GROUP BY 
	p.product_id,
	p.product_name
ORDER BY total_sales DESC;

SELECT 
	p.product_id,
	p.product_name,
    sum(s.sale_amount) as total_sales
FROM product p
join sales s on p.product_id = s.product_id
GROUP BY 
	p.product_id,
	p.product_name
ORDER BY total_sales DESC
LIMIT 3;


 SELECT 
	p.product_id,
	p.product_name,
    sum(s.sale_amount) as total_sales,
	ROUND(AVG(s.sale_amount),2) as avg_sales
FROM product p
join sales s on p.product_id = s.product_id
GROUP BY 
	p.product_id,
	p.product_name
HAVING total_sales> 30000 AND
		avg_sales > 10000;
		

    
    
    