USE classicmodels;

## INNER JOIN
# The INNER JOIN keyword selects records that have matching values in both tables.
# JOIN and INNER JOIN will return the same result.

# EX- Join Products and Categories with the INNER JOIN keyword
SELECT CustomerName, City
FROM Customers
INNER JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber;


## LEFT JOIN 
# The LEFT JOIN keyword returns all records from the left table (table1), 
#       and the matching records from the right table (table2). The result is 0 records from the right side, 
#       if there is no match.

SELECT Customers.CustomerName, Orders.OrderNumber
FROM Customers
LEFT JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
ORDER BY Customers.CustomerName;

## RIGHT JOIN
# The RIGHT JOIN keyword returns all records from the right table (table2), 
#       and the matching records from the left table (table1). 
# The result is 0 records from the left side, if there is no match.

SELECT Customers.CustomerName, Orders.OrderNumber
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
ORDER BY Customers.CustomerName;

## FULL OUTER JOIN Keyword
# The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
# FULL OUTER JOIN and FULL JOIN are the same.

SELECT Customers.CustomerName, Orders.OrderNumber
FROM Customers
FULL JOIN Orders ON Customers.CustomerNumber = Orders.CustomerNumber
ORDER BY Customers.CustomerName;


## self Join
# A self join is a regular join, but the table is joined with itself

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerNumber <> B.CustomerNumber
AND A.City = B.City
ORDER BY A.City;

## UNION 
# The UNION operator is used to combine the result-set of two or more SELECT statements.
# Every SELECT statement within UNION must have the same number of columns
# The columns must also have similar data types
# The columns in every SELECT statement must also be in the same order

SELECT City FROM Customers
UNION
SELECT City FROM Offices
ORDER BY City;