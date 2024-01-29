USE classicmodels;

## MIN() and MAX() Functions ##
# The MIN() function returns the smallest value of the selected column.

# The MAX() function returns the largest value of the selected column.

# Ex- Find the lowest price
SELECT MIN(Amount)
FROM Payments;

# Ex- Find the highest price
SELECT MAX(Amount)
FROM Payments;

## COUNT() Function ##
# The COUNT() function returns the number of rows that matches a specified criterion

# EX- Find the total number of products in the Products table:
SELECT COUNT(*)
FROM Products;

# Ex- Find the number of products where Price is higher than 20
SELECT COUNT(Productcode)
FROM Products
WHERE BuyPrice > 90;

### Ignore Duplicates
SELECT COUNT(DISTINCT BuyPrice)
FROM Products;

## SUM() Function
# The SUM() function returns the total sum of a numeric column.

# Ex- Return the sum of all Quantity fields in the OrderDetails table:
SELECT SUM(QuantityOrdered)
FROM OrderDetails;

# Ex- Return the number of orders made for the product with ProductID 11:

SELECT SUM(QuantityOrdered)
FROM OrderDetails
WHERE OrderNumber = 10100;

## SUM() with an expression
# Ex - Use an expression inside the SUM() function
SELECT SUM(QuantityOrdered * 10)
FROM OrderDetails;

## AVG() Function
# The AVG() function returns the average value of a numeric column.

# Ex - Find the average price of all products:
SELECT AVG(BuyPrice)
FROM Products;

# Ex - Return the average price of products in category 1:
SELECT AVG(BuyPrice)
FROM Products
WHERE ProductLine = 'Classic Cars';

