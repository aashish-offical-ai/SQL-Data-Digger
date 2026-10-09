-- PROJECT: DATA DIGGER
DROP DATABASE Data_Digger;
CREATE DATABASE Data_Digger;
USE Data_Digger;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200)
);


-- Insert at least 5 sample customers

INSERT INTO Customers
(CustomerID, Name, Email, Address)
VALUES
(1, 'Aashish', 'aashish@gmail.com', 'Mumbai'),
(2, 'Rahul', 'rahul@gmail.com', 'Surat'),
(3, 'Priya', 'priya@gmail.com', 'Ahmedabad'),
(4, 'Yash', 'yash@gmail.com', 'Delhi'),
(5, 'Daksh', 'daksh@gmail.com', 'Pune');

SELECT *
FROM Customers;

UPDATE Customers
SET Address = 'Vadodara'
WHERE CustomerID = 2;

SELECT *
FROM Customers
WHERE CustomerID = 2;

SELECT *
FROM Customers
WHERE Name = 'Aashish';

DELETE FROM Customers
WHERE CustomerID = 5;

SELECT *
FROM Customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2026-09-25', 1500.00),
(102, 2, '2026-09-20', 2200.00),
(103, 3, '2026-09-15', 800.00),
(104, 1, '2026-09-10', 1200.00),
(105, 4, '2026-08-10', 2500.00);

SELECT *
FROM Orders
WHERE CustomerID = 1;

UPDATE Orders
SET TotalAmount = 1600.00
WHERE OrderID = 101;

SELECT *
FROM Orders
WHERE OrderID = 101;

DELETE FROM Orders
WHERE OrderID = 105;

SELECT *
FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL 30 DAY;

SELECT
    MAX(TotalAmount) AS Highest_Order_Amount,
    MIN(TotalAmount) AS Lowest_Order_Amount,
    AVG(TotalAmount) AS Average_Order_Amount
FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products
(ProductID, ProductName, Price, Stock)
VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Smartphone', 25000.00, 20),
(203, 'Headphones', 1500.00, 0),
(204, 'Keyboard', 1200.00, 15),
(205, 'Mouse', 800.00, 25);

SELECT *
FROM Products
ORDER BY Price DESC;

UPDATE Products
SET Price = 27000.00
WHERE ProductID = 202;

SELECT *
FROM Products
WHERE ProductID = 202;

DELETE FROM Products
WHERE ProductID = 203
AND Stock = 0;

SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;

SELECT
    MAX(Price) AS Most_Expensive_Product_Price,
    MIN(Price) AS Cheapest_Product_Price
FROM Products;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, SubTotal)
VALUES
(301, 101, 201, 1, 55000.00),
(302, 101, 204, 2, 2400.00),
(303, 102, 202, 1, 25000.00),
(304, 103, 205, 3, 2400.00),
(305, 104, 204, 1, 1200.00);

SELECT *
FROM OrderDetails
WHERE OrderID = 101;

SELECT
    SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

SELECT
    ProductID,
    SUM(Quantity) AS Total_Quantity_Sold
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;

SELECT
    ProductID,
    COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 204
GROUP BY ProductID;

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Products;

SELECT * FROM OrderDetails;

DESC Customers;

DESC Orders;

DESC Products;

DESC OrderDetails;
