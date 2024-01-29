USE Classicmodels;

## WHERE Clause
# The WHERE clause is used to filter records.
# It is used to extract only those records that fulfill a specified condition.

# Ex- Select all customers from France
SELECT * FROM Customers
WHERE Country='France';

SELECT * FROM Customers
WHERE CustomerNumber=119;

## LIMIT Clause
# The LIMIT clause is used to specify the number of records to return.
# The LIMIT clause is useful on large tables with thousands of records.
# Returning a large number of records can impact performance.

SELECT * FROM Customers
LIMIT 3;

# To select records 4 - 6 (inclusive)?
# MySQL provides a way to handle this: by using OFFSET.

# Ex-
SELECT * FROM Customers
LIMIT 3 OFFSET 3;


## HAVING Clause
# The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

SELECT COUNT(CustomerNumber), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerNumber) > 5;

