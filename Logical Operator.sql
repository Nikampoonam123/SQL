USE classicmodels;

## AND Operator ##
# The WHERE clause can contain one or many AND operators.
# The AND operator is used to filter records based on more than one condition

# Ex- Select all customers from Spain that starts with the letter 'G':
SELECT *
FROM Customers
WHERE Country = 'France' AND CustomerName LIKE 'L%';

### All Conditions Must Be True ###
# Ex- selects all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000
SELECT * FROM Customers
WHERE Country = 'Germany'
AND City = 'Berlin'
AND PostalCode > 1200;

## OR Operator ##
# The WHERE clause can contain one or more OR operators.
# The OR operator is used to filter records based on more than one condition

# Ex- Select all customers from Germany or Spain
SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

## The OR operator displays a record if any of the conditions are TRUE.

## The AND operator displays a record if all the conditions are TRUE.

## NOT Operator ##
# The NOT operator is used in combination with other operators to give the opposite result, also called the negative result.

# Ex- Select only the customers that are NOT from Spain
SELECT * FROM Customers
WHERE NOT Country = 'Spain';

# EX- Select customers with a CustomerId not greater than 50
SELECT * FROM Customers
WHERE NOT CustomerNumber > 103;

