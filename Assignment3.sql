/*
Q3. SQL Queries - all types of Join, Sub-Query and View:
Write at least 10 SQL queries for suitable database application using SQL DML statements.

Note: Instructor will design the queries which demonstrate the use of concepts like all types of
Join, Sub-Query and View 
*/

--TABLES FOR SAMPLE DATA--

CREATE DATABASE IF NOT EXISTS DB;

USE DB;

CREATE TABLE IF NOT EXISTS customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Springfield', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', 'Metropolis', 'Mexico'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '5551234567', '789 Pine Road', 'Gotham', 'France'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '1112223333', '101 Maple Street', 'Star City', 'USA'),
(5, 'Emily', 'Davis', 'emily.davis@example.com', '2223334444', '202 Birch Lane', 'Central City', 'Canada'),
(6, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '3334445555', '303 Cedar Avenue', 'Coast City', 'UK'),
(7, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '4445556666', '404 Spruce Road', 'Keystone City', 'Australia'),
(8, 'James', 'Anderson', 'james.anderson@example.com', '5556667777', '505 Pine Street', 'Starling City', 'USA'),
(9, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '6667778888', '606 Oak Avenue', 'National City', 'Canada'),
(10, 'William', 'Thomas', 'william.thomas@example.com', '7778889999', '707 Willow Road', 'Blüdhaven', 'UK'),
(11, 'Ava', 'Jackson', 'ava.jackson@example.com', '8889990000', '808 Ash Lane', 'Fawcett City', 'Australia'),
(12, 'Alexander', 'White', 'alexander.white@example.com', '9990001111', '909 Elm Street', 'Opal City', 'USA'),
(13, 'Isabella', 'Harris', 'isabella.harris@example.com', '0001112222', '1010 Maple Avenue', 'Gateway City', 'Canada');

SELECT * FROM customers;

/*
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+
| CustomerID | FirstName | LastName | Email                       | Phone      | Address           | City          | Country   |
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street    | Springfield   | USA       |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue    | Metropolis    | Mexico    |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road     | Gotham        | France    |
|          4 | Michael   | Brown    | michael.brown@example.com   | 1112223333 | 101 Maple Street  | Star City     | USA       |
|          5 | Emily     | Davis    | emily.davis@example.com     | 2223334444 | 202 Birch Lane    | Central City  | Canada    |
|          6 | Daniel    | Wilson   | daniel.wilson@example.com   | 3334445555 | 303 Cedar Avenue  | Coast City    | UK        |
|          7 | Sophia    | Martinez | sophia.martinez@example.com | 4445556666 | 404 Spruce Road   | Keystone City | Australia |
|          8 | James     | Anderson | james.anderson@example.com  | 5556667777 | 505 Pine Street   | Starling City | USA       |
|          9 | Olivia    | Taylor   | olivia.taylor@example.com   | 6667778888 | 606 Oak Avenue    | National City | Canada    |
|         10 | William   | Thomas   | william.thomas@example.com  | 7778889999 | 707 Willow Road   | Blüdhaven     | UK        |
|         11 | Ava       | Jackson  | ava.jackson@example.com     | 8889990000 | 808 Ash Lane      | Fawcett City  | Australia |
|         12 | Alexander | White    | alexander.white@example.com | 9990001111 | 909 Elm Street    | Opal City     | USA       |
|         13 | Isabella  | Harris   | isabella.harris@example.com | 0001112222 | 1010 Maple Avenue | Gateway City  | Canada    |
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+
*/


CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount)
VALUES
(1, '2024-09-01', 1, 150.00),
(2, '2024-09-02', 2, 200.00),
(3, '2024-09-03', 3, 250.00),
(4, '2024-09-04', 1, 300.00),
(5, '2024-09-05', 2, 350.00),
(6, '2024-09-06', 3, 400.00),
(7, '2024-09-07', 4, 450.00),
(8, '2024-09-08', 5, 500.00),
(9, '2024-09-09', 6, 550.00),
(10, '2024-09-10', 7, 600.00);

SELECT * FROM Orders;

/*
+---------+------------+------------+--------+
| OrderID | OrderDate  | CustomerID | Amount |
+---------+------------+------------+--------+
|       1 | 2024-09-01 |          1 | 150.00 |
|       2 | 2024-09-02 |          2 | 200.00 |
|       3 | 2024-09-03 |          3 | 250.00 |
|       4 | 2024-09-04 |          1 | 300.00 |
|       5 | 2024-09-05 |          2 | 350.00 |
|       6 | 2024-09-06 |          3 | 400.00 |
|       7 | 2024-09-07 |          4 | 450.00 |
|       8 | 2024-09-08 |          5 | 500.00 |
|       9 | 2024-09-09 |          6 | 550.00 |
|      10 | 2024-09-10 |          7 | 600.00 |
+---------+------------+------------+--------+
*/

--Group By and Having clause--

SELECT count(CustomerID), Country from customers
GROUP BY Country;

/*
+-------------------+-----------+
| count(CustomerID) | Country   |
+-------------------+-----------+
|                 4 | USA       |
|                 1 | Mexico    |
|                 1 | France    |
|                 3 | Canada    |
|                 2 | UK        |
|                 2 | Australia |
+-------------------+-----------+
*/

SELECT count(CustomerID), Country from customers 
GROUP BY Country
HAVING count(CustomerID) >=3;

/*
+-------------------+---------+
| count(CustomerID) | Country |
+-------------------+---------+
|                 4 | USA     |
|                 3 | Canada  |
+-------------------+---------+
*/


--Joins--

SELECT * FROM customers INNER JOIN Orders on customers.CustomerID = Orders.CustomerID;

/*
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
| CustomerID | FirstName | LastName | Email                       | Phone      | Address          | City          | Country   | OrderID | OrderDate  | CustomerID | Amount |
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street   | Springfield   | USA       |       1 | 2024-09-01 |          1 | 150.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue   | Metropolis    | Mexico    |       2 | 2024-09-02 |          2 | 200.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road    | Gotham        | France    |       3 | 2024-09-03 |          3 | 250.00 |
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street   | Springfield   | USA       |       4 | 2024-09-04 |          1 | 300.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue   | Metropolis    | Mexico    |       5 | 2024-09-05 |          2 | 350.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road    | Gotham        | France    |       6 | 2024-09-06 |          3 | 400.00 |
|          4 | Michael   | Brown    | michael.brown@example.com   | 1112223333 | 101 Maple Street | Star City     | USA       |       7 | 2024-09-07 |          4 | 450.00 |
|          5 | Emily     | Davis    | emily.davis@example.com     | 2223334444 | 202 Birch Lane   | Central City  | Canada    |       8 | 2024-09-08 |          5 | 500.00 |
|          6 | Daniel    | Wilson   | daniel.wilson@example.com   | 3334445555 | 303 Cedar Avenue | Coast City    | UK        |       9 | 2024-09-09 |          6 | 550.00 |
|          7 | Sophia    | Martinez | sophia.martinez@example.com | 4445556666 | 404 Spruce Road  | Keystone City | Australia |      10 | 2024-09-10 |          7 | 600.00 |
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
*/


SELECT * FROM customers LEFT JOIN Orders on customers.CustomerID = Orders.CustomerID;

/*
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+---------+------------+------------+--------+
| CustomerID | FirstName | LastName | Email                       | Phone      | Address           | City          | Country   | OrderID | OrderDate  | CustomerID | Amount |
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+---------+------------+------------+--------+
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street    | Springfield   | USA       |       1 | 2024-09-01 |          1 | 150.00 |
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street    | Springfield   | USA       |       4 | 2024-09-04 |          1 | 300.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue    | Metropolis    | Mexico    |       2 | 2024-09-02 |          2 | 200.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue    | Metropolis    | Mexico    |       5 | 2024-09-05 |          2 | 350.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road     | Gotham        | France    |       3 | 2024-09-03 |          3 | 250.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road     | Gotham        | France    |       6 | 2024-09-06 |          3 | 400.00 |
|          4 | Michael   | Brown    | michael.brown@example.com   | 1112223333 | 101 Maple Street  | Star City     | USA       |       7 | 2024-09-07 |          4 | 450.00 |
|          5 | Emily     | Davis    | emily.davis@example.com     | 2223334444 | 202 Birch Lane    | Central City  | Canada    |       8 | 2024-09-08 |          5 | 500.00 |
|          6 | Daniel    | Wilson   | daniel.wilson@example.com   | 3334445555 | 303 Cedar Avenue  | Coast City    | UK        |       9 | 2024-09-09 |          6 | 550.00 |
|          7 | Sophia    | Martinez | sophia.martinez@example.com | 4445556666 | 404 Spruce Road   | Keystone City | Australia |      10 | 2024-09-10 |          7 | 600.00 |
|          8 | James     | Anderson | james.anderson@example.com  | 5556667777 | 505 Pine Street   | Starling City | USA       |    NULL | NULL       |       NULL |   NULL |
|          9 | Olivia    | Taylor   | olivia.taylor@example.com   | 6667778888 | 606 Oak Avenue    | National City | Canada    |    NULL | NULL       |       NULL |   NULL |
|         10 | William   | Thomas   | william.thomas@example.com  | 7778889999 | 707 Willow Road   | Blüdhaven     | UK        |    NULL | NULL       |       NULL |   NULL |
|         11 | Ava       | Jackson  | ava.jackson@example.com     | 8889990000 | 808 Ash Lane      | Fawcett City  | Australia |    NULL | NULL       |       NULL |   NULL |
|         12 | Alexander | White    | alexander.white@example.com | 9990001111 | 909 Elm Street    | Opal City     | USA       |    NULL | NULL       |       NULL |   NULL |
|         13 | Isabella  | Harris   | isabella.harris@example.com | 0001112222 | 1010 Maple Avenue | Gateway City  | Canada    |    NULL | NULL       |       NULL |   NULL |
+------------+-----------+----------+-----------------------------+------------+-------------------+---------------+-----------+---------+------------+------------+--------+
*/

SELECT * FROM customers RIGHT JOIN Orders on customers.CustomerID = Orders.CustomerID;
/*
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
| CustomerID | FirstName | LastName | Email                       | Phone      | Address          | City          | Country   | OrderID | OrderDate  | CustomerID | Amount |
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street   | Springfield   | USA       |       1 | 2024-09-01 |          1 | 150.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue   | Metropolis    | Mexico    |       2 | 2024-09-02 |          2 | 200.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road    | Gotham        | France    |       3 | 2024-09-03 |          3 | 250.00 |
|          1 | John      | Doe      | john.doe@example.com        | 1234567890 | 123 Elm Street   | Springfield   | USA       |       4 | 2024-09-04 |          1 | 300.00 |
|          2 | Jane      | Smith    | jane.smith@example.com      | 0987654321 | 456 Oak Avenue   | Metropolis    | Mexico    |       5 | 2024-09-05 |          2 | 350.00 |
|          3 | Alice     | Johnson  | alice.johnson@example.com   | 5551234567 | 789 Pine Road    | Gotham        | France    |       6 | 2024-09-06 |          3 | 400.00 |
|          4 | Michael   | Brown    | michael.brown@example.com   | 1112223333 | 101 Maple Street | Star City     | USA       |       7 | 2024-09-07 |          4 | 450.00 |
|          5 | Emily     | Davis    | emily.davis@example.com     | 2223334444 | 202 Birch Lane   | Central City  | Canada    |       8 | 2024-09-08 |          5 | 500.00 |
|          6 | Daniel    | Wilson   | daniel.wilson@example.com   | 3334445555 | 303 Cedar Avenue | Coast City    | UK        |       9 | 2024-09-09 |          6 | 550.00 |
|          7 | Sophia    | Martinez | sophia.martinez@example.com | 4445556666 | 404 Spruce Road  | Keystone City | Australia |      10 | 2024-09-10 |          7 | 600.00 |
+------------+-----------+----------+-----------------------------+------------+------------------+---------------+-----------+---------+------------+------------+--------+
*/

--Views--

CREATE VIEW CustomerOrders AS
SELECT 
    customers.CustomerID,
    CONCAT(customers.FirstName, ' ', customers.LastName) AS CustomerName,
    Orders.OrderID,
    customers.Country
FROM 
     customers
JOIN 
    Orders ON customers.CustomerID = Orders.CustomerID;

SELECT * FROM CustomerOrders;

/*
+------------+-----------------+---------+-----------+
| CustomerID | CustomerName    | OrderID | Country   |
+------------+-----------------+---------+-----------+
|          1 | John Doe        |       1 | USA       |
|          1 | John Doe        |       4 | USA       |
|          2 | Jane Smith      |       2 | Mexico    |
|          2 | Jane Smith      |       5 | Mexico    |
|          3 | Alice Johnson   |       3 | France    |
|          3 | Alice Johnson   |       6 | France    |
|          4 | Michael Brown   |       7 | USA       |
|          5 | Emily Davis     |       8 | Canada    |
|          6 | Daniel Wilson   |       9 | UK        |
|          7 | Sophia Martinez |      10 | Australia |
+------------+-----------------+---------+-----------+
*/


--Sub-Query--

SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS CustomerName, Country
FROM customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Amount > 300
);

/*
+------------+-----------------+-----------+
| CustomerID | CustomerName    | Country   |
+------------+-----------------+-----------+
|          2 | Jane Smith      | Mexico    |
|          3 | Alice Johnson   | France    |
|          4 | Michael Brown   | USA       |
|          5 | Emily Davis     | Canada    |
|          6 | Daniel Wilson   | UK        |
|          7 | Sophia Martinez | Australia |
+------------+-----------------+-----------+
*/
 