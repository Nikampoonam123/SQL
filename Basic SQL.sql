USE classicmodels;

## SELECT 
# The SELECT statement is used to select data from a database.

# EX- Return all the columns from the Customers table
SELECT * FROM customers;

# EX- Return data from the Customers table
SELECT CustomerName, City FROM Customers;

## SELECT DISTINCT 
# The SELECT DISTINCT statement is used to return only distinct (different) values.

# EX- Select all the different countries from the "Customers" table:
SELECT DISTINCT Country FROM Customers;

## Single Line Comments
# Single line comments start with # .
# Any text between # and the end of the line will be ignored (will not be executed).

# Ex 
SELECT * FROM Customers; # All records 

# multi-line comment to ignore many statements
# Example
/*SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Categories;*/
SELECT * FROM Suppliers;


## ORDER BY 
# The ORDER BY keyword is used to sort the result-set in ascending or descending order.

#Ex- Sort the payments by amount
SELECT * FROM Payments
ORDER BY Amount;

## DESC keyword ##
# The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

# Ex- Sort the payments from highest to lowest price:
SELECT * FROM Payments
ORDER BY Amount DESC;

## ORDER BY Several Columns ##
SELECT * FROM Customers
ORDER BY Country, CustomerName;

## Both ASC and DESC ##
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

## Aliases
# SQL aliases are used to give a table, or a column in a table, a temporary name.
# Aliases are often used to make column names more readable.
# An alias only exists for the duration of that query.
# An alias is created with the AS keyword.

# Ex-
SELECT CustomerNumber AS ID
FROM Customers;

## AS is Optional ##
# Actually, in most database languages, you can skip the AS keyword and get the same result:

# Example
SELECT CustomerNumber ID
FROM Customers;

## INSERT INTO Statement
# The INSERT INTO statement is used to insert new records in a table.

CREATE TABLE Sales (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255));
    
INSERT INTO Sales (PersonID,LastName,FirstName,Address,City)
VALUES (1,'Nikam','Poonam','Pimple Gurav','Pune');

SELECT * FROM Sales;

## UPDATE Statement
# The UPDATE statement is used to modify the existing records in a table.

UPDATE Customers
SET CustomerName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerNumber = 103;

## Be careful when updating records. If you omit the WHERE clause, ALL records will be updated! ##

## DELETE Statement
# The DELETE statement is used to delete existing records in a table.

DELETE FROM Customers WHERE CustomerName='Alfred Schmidt';


## GROUP BY Statement
#The GROUP BY statement groups rows that have the same values into summary rows.
# The GROUP BY statement is often used with aggregate functions
#    (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

SELECT COUNT(CustomerNumber), Country
FROM Customers
GROUP BY Country;

SELECT Country, COUNT(CustomerNumber)
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerNumber) DESC;




