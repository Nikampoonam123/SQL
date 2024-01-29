USE CLASSICMODELS;

## IF NULL OPERATOR
# The MySQL IFNULL() function lets you return an alternative value if an expression is NULL

SELECT ProductName, BuyPrice * (QuantityInStock + IFNULL(MSRP, 0)) AS Total
FROM Products;


## COALESCE()
SELECT ProductName, BuyPrice * (QuantityInStock + COALESCE(MSRP, 0)) AS Total
FROM Products;