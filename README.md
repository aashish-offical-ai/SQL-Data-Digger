# Data Digger - SQL Database Project

## Project Overview

**Data Digger** is a MySQL database project designed to manage and analyze customer, order, product, and order-detail information.

The project demonstrates important SQL and database concepts such as:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Constraints
* Data insertion
* Data updating
* Data deletion
* Filtering records
* Sorting records
* Aggregate functions
* Group By
* Date-based filtering
* Joins through relational table structure
* Basic sales and product analysis

---

## Database Name

```sql
Data_Digger
```

---

## Database Structure

The project contains four main tables:

```text
Data_Digger
│
├── Customers
├── Orders
├── Products
└── OrderDetails
```

### 1. Customers

Stores customer information.

| Column     | Data Type    | Description        |
| ---------- | ------------ | ------------------ |
| CustomerID | INT          | Unique customer ID |
| Name       | VARCHAR(100) | Customer name      |
| Email      | VARCHAR(100) | Customer email     |
| Address    | VARCHAR(200) | Customer address   |

Primary Key:

```text
CustomerID
```

---

### 2. Orders

Stores customer order information.

| Column      | Data Type     | Description        |
| ----------- | ------------- | ------------------ |
| OrderID     | INT           | Unique order ID    |
| CustomerID  | INT           | ID of the customer |
| OrderDate   | DATE          | Date of the order  |
| TotalAmount | DECIMAL(10,2) | Total order amount |

Primary Key:

```text
OrderID
```

Foreign Key:

```text
CustomerID → Customers(CustomerID)
```

---

### 3. Products

Stores product information.

| Column      | Data Type     | Description       |
| ----------- | ------------- | ----------------- |
| ProductID   | INT           | Unique product ID |
| ProductName | VARCHAR(100)  | Product name      |
| Price       | DECIMAL(10,2) | Product price     |
| Stock       | INT           | Available stock   |

Primary Key:

```text
ProductID
```

---

### 4. OrderDetails

Stores the products included in each order.

| Column        | Data Type     | Description            |
| ------------- | ------------- | ---------------------- |
| OrderDetailID | INT           | Unique order-detail ID |
| OrderID       | INT           | Related order ID       |
| ProductID     | INT           | Related product ID     |
| Quantity      | INT           | Quantity purchased     |
| SubTotal      | DECIMAL(10,2) | Subtotal amount        |

Primary Key:

```text
OrderDetailID
```

Foreign Keys:

```text
OrderID → Orders(OrderID)
ProductID → Products(ProductID)
```

---

## Table Relationships

The database follows a relational structure:

```text
Customers
    │
    │ CustomerID
    ▼
Orders
    │
    │ OrderID
    ▼
OrderDetails
    ▲
    │ ProductID
    │
Products
```

### Relationship Summary

* One customer can have multiple orders.
* One order can contain multiple order details.
* One product can appear in multiple order details.
* `OrderDetails` connects `Orders` and `Products`.

---

## Sample Data

### Customers

The project contains sample customers such as:

* Aashish
* Rahul
* Priya
* Yash
* Daksh

### Products

The project contains sample products such as:

* Laptop
* Smartphone
* Headphones
* Keyboard
* Mouse

### Orders

Sample orders are created with different dates and amounts to demonstrate filtering and analysis.

---

## SQL Operations Used

### Create Database

```sql
CREATE DATABASE Data_Digger;
USE Data_Digger;
```

### Insert Data

The project uses `INSERT INTO` to add customers, orders, products, and order details.

### Update Data

Examples include:

```sql
UPDATE Customers
SET Address = 'Vadodara'
WHERE CustomerID = 2;
```

and:

```sql
UPDATE Products
SET Price = 27000.00
WHERE ProductID = 202;
```

### Delete Data

The project demonstrates conditional deletion:

```sql
DELETE FROM Products
WHERE ProductID = 203
AND Stock = 0;
```

### Filtering

The project uses `WHERE`, `BETWEEN`, and date conditions to filter records.

Example:

```sql
SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;
```

### Sorting

Products are sorted by price:

```sql
SELECT *
FROM Products
ORDER BY Price DESC;
```

### Aggregate Functions

The project uses:

* `MAX()`
* `MIN()`
* `AVG()`
* `SUM()`
* `COUNT()`

Example:

```sql
SELECT
    MAX(TotalAmount) AS Highest_Order_Amount,
    MIN(TotalAmount) AS Lowest_Order_Amount,
    AVG(TotalAmount) AS Average_Order_Amount
FROM Orders;
```

### Grouping

The project uses `GROUP BY` to calculate product sales quantities:

```sql
SELECT
    ProductID,
    SUM(Quantity) AS Total_Quantity_Sold
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;
```

### Date Filtering

Orders from the last 30 days are retrieved using:

```sql
SELECT *
FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL 30 DAY;
```

---

## Database Analysis

The project performs basic business analysis, including:

* Finding the highest order amount
* Finding the lowest order amount
* Calculating average order amount
* Calculating total revenue
* Finding the top 3 products by quantity sold
* Counting how many times a particular product was sold
* Finding products within a specific price range
* Finding orders from the last 30 days

---

## Technologies Used

* MySQL
* SQL
* MySQL Workbench

---

## How to Run the Project

### Step 1: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 2: Open the SQL File

Open the project SQL file in MySQL Workbench.

### Step 3: Execute the Script

Run the complete SQL script.

The script will:

1. Create the database.
2. Create all required tables.
3. Insert sample data.
4. Perform update operations.
5. Perform delete operations.
6. Execute filtering and sorting queries.
7. Perform aggregate calculations.
8. Perform sales analysis.

### Step 4: Verify Tables

Run:

```sql
SHOW TABLES;
```

You should see:

```text
Customers
Orders
Products
OrderDetails
```

---

## Project Purpose

The purpose of this project is to practice SQL database management and understand how multiple related tables can be used to store and analyze business data.

This project is suitable for beginners learning:

* MySQL
* SQL Queries
* Database Design
* Primary and Foreign Keys
* CRUD Operations
* Aggregate Functions
* Data Analysis using SQL

---

## Author

**Aashish**
