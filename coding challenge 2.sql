--- bookstore --
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE books (
	book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL (8,2) CHECK (price>0)
    );

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    book_id INT,
    order_date DATE NOT NULL,
    quantity INT CHECK(Quantity>0)
    );
    
INSERT INTO Books (Book_id, Title, author, ISBN, Price)
VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'ISBN001', 499.50),
(2, 'Atomic Habits', 'James Clear', 'ISBN002', 650.00),
(3, 'Python Crash Course', 'Eric Matthes', 'ISBN003', 850.75),
(4, 'Think and Grow Rich', 'Napoleon Hill', 'ISBN004', 399.00),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'ISBN005', 450.00);

INSERT INTO Orders (order_id, book_id, order_date, quantity)
VALUES
(101, 1, '2025-02-15', 2),
(102, 3, '2025-02-16', 1),
(103, 5, '2025-02-17', 4);

SELECT * FROM Books; 
SELECT * FROM orders;

UPDATE books
SET price = 700.00
WHERE book_id = 2; 

DELETE FROM Orders
WHERE order_id = 103;

TRUNCATE ORDERS;