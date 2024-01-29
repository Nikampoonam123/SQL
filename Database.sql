## CREATE DATABASE Statement
#The CREATE DATABASE statement is used to create a new SQL database.

CREATE DATABASE Practices;


## DROP DATABASE Statement
# The DROP DATABASE statement is used to drop an existing SQL database.

DROP DATABASE Practices;

## CREATE TABLE Statement
# The CREATE TABLE statement is used to create a new table in a database.

CREATE DATABASE Practice;

USE Practice;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255));
    
    
## DROP TABLE Statement
# The DROP TABLE statement is used to drop an existing table in a database.

DROP TABLE Persons;

## TRUNCATE TABLE
# The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    ZipCode varchar(255));

TRUNCATE TABLE Persons;

## ALTER TABLE Statement
# The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
#The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

ALTER TABLE Persons
ADD Email varchar(255);

ALTER TABLE Persons
DROP COLUMN Email;

ALTER TABLE Persons
MODIFY COLUMN ZipCode int;

ALTER TABLE Persons
ADD DateOfBirth date;


