-- Assignment: Database Design and Normalization
-- Your Name: [Add your name here]
-- This file includes solutions for fixing table structure problems using 1NF and 2NF

-- ---------------------------
-- Question 1: Fixing 1NF
-- ---------------------------

-- Remove the table if it already exists so we don’t get an error
DROP TABLE IF EXISTS ProductDetail_1NF;

-- Create a new table where each product has its own row
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(100)
);

-- Add the rows so each product is listed separately
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ---------------------------
-- Question 2: Fixing 2NF
-- ---------------------------

-- Remove these tables if they already exist
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

-- This table will just store order IDs and customer names
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Add the customer data based on the order
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- This table will store which products were ordered and in what quantity
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Add the order items
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
