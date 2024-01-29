USE classicmodels;

## NULL Value
# A field with a NULL value is a field with no value.

## NULL Operator
# The IS NULL operator is used to test for empty values (NULL values).

# Ex-
SELECT CustomerName, Country, Creditlimit
FROM Customers
WHERE Creditlimit IS NULL;


## IS NOT NULL Operator
# The IS NOT NULL operator is used to test for non-empty values (NOT NULL values).

# Ex- 
SELECT CustomerName, Creditlimit
FROM Customers
WHERE Creditlimit IS NOT NULL;


## LIKE Operator
# The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
#There are two wildcards often used in conjunction with the LIKE operator:
#        The percent sign % represents zero, one, or multiple characters
#        The underscore sign _ represents one, single character

## Without wildcards
# Ex- Return all customers from Spain:
SELECT * FROM Customers
WHERE Country LIKE 'Spain';

## Wildcard Characters
# A wildcard character is used to substitute one or more characters in a string.

# Select all customers that starts with the letter "a"
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# Return all customers with a City starting with any character, followed by "ondon":
SELECT * FROM Customers
WHERE City LIKE '_ondon';


## IN Operator
# The IN operator allows you to specify multiple values in a WHERE clause.
# The IN operator is a shorthand for multiple OR conditions.

# Return all customers from 'Germany', 'France', or 'UK'
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');


## NOT IN
# Ex - Return all customers that are NOT from 'Germany', 'France', or 'UK':

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

# IN (SELECT)
# use IN with a subquery in the WHERE clause.

# Return all customers that have an order in the Orders table
SELECT * FROM Customers
WHERE CustomerNumber IN (SELECT CustomerNumber FROM Orders);


## BETWEEN Operator
# The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
# The BETWEEN operator is inclusive: begin and end values are included. 

# Selects all products with a price between 10 and 20:
SELECT * FROM Products
WHERE BuyPrice BETWEEN 10 AND 20;


## NOT BETWEEN
# To display the products outside the range 

# Example
SELECT * FROM Products
WHERE BuyPrice NOT BETWEEN 10 AND 20;


## BETWEEN IN
# Example
SELECT * FROM Products
WHERE BuyPrice BETWEEN 20 AND 30
AND Productline IN ('Motorcycles','Classic Cars');


## EXISTS Operator
# The EXISTS operator is used to test for the existence of any record in a subquery.
# The EXISTS operator returns TRUE if the subquery returns one or more records.

SELECT Status
FROM Orders
WHERE EXISTS (SELECT orderlinenumber FROM Orderdetails WHERE Orders.OrderNumber = Orderdetails.OrderNumber AND PriceEach < 20);


## ANY and ALL Operators
# The ANY and ALL operators allow you to perform a comparison between a single column value and a range of other values.

## ANY Operator
# returns a boolean value as a result
# returns TRUE if ANY of the subquery values meet the condition
# ANY means that the condition will be true if the operation is true for any of the values in the range.


SELECT ProductName
FROM Products
WHERE Productcode = ANY
  (SELECT Productcode
  FROM OrderDetails
  WHERE QuantityOrdered = 10);
  
SELECT ProductName
FROM Products
WHERE Productcode = ANY
  (SELECT Productcode
  FROM OrderDetails
  WHERE QuantityOrdered > 19);
 
##  ALL Operator
# returns a boolean value as a result
# returns TRUE if ALL of the subquery values meet the condition
# is used with SELECT, WHERE and HAVING statements
# ALL means that the condition will be true only if the operation is true for all values in the range. 

SELECT ALL ProductName
FROM Products
WHERE TRUE;

SELECT ProductName
FROM Products
WHERE Productcode = ALL
  (SELECT Productcode
  FROM OrderDetails
  WHERE QuantityOrdered < 19);
  
  
## SOME OPERATOR
SELECT * FROM Products
WHERE BuyPrice > SOME (SELECT BuyPrice FROM Products WHERE BuyPrice > 100);
  
## CASE Expression
# The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement).
# So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.
# If there is no ELSE part and no conditions are true, it returns NULL.
  
SELECT OrderNumber, QuantityOrdered,
CASE
    WHEN QuantityOrdered > 30 THEN 'The quantity is greater than 30'
    WHEN QuantityOrdered = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

