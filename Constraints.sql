USE PRACTICE;

# Create Constraints
#Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

## NOT NULL Constraint
# The NOT NULL constraint enforces a column to NOT accept NULL values.

CREATE TABLE Customers (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int);
    
ALTER TABLE Customers
MODIFY COLUMN Age int NOT NULL;

## UNIQUE Constraint
# The UNIQUE constraint ensures that all values in a column are different.
# Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
# A PRIMARY KEY constraint automatically has a UNIQUE constraint.

Drop Table Persons;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)  #UNIQUE values
);

# Unique Constraints for multiple columns
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

# UNIQUE Constraint on ALTER TABLE
ALTER TABLE Persons
ADD UNIQUE (ID);

# DROP a UNIQUE Constraint
# To drop a UNIQUE constraint, use the following SQL:

ALTER TABLE Persons
DROP INDEX UC_Person;

## PRIMARY KEY Constraint
# The PRIMARY KEY constraint uniquely identifies each record in a table.
# Primary keys must contain UNIQUE values, and cannot contain NULL values.
# A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

Drop Table Persons;

# PRIMARY KEY on CREATE TABLE
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

# Multiple Primary keys
CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID,LastName)
);

# DROP a PRIMARY KEY Constraint
ALTER TABLE Persons
DROP PRIMARY KEY;

# Add PRIMARY KEY using ALTER TABLE
ALTER TABLE Persons
ADD PRIMARY KEY (ID);


## FOREIGN KEY Constraint
# The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
# A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
# The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

# FOREIGN KEY on ALTER TABLE
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

## FOREIGN KEY constraint on multiple columns

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

## DROP a FOREIGN KEY Constraint
# To drop a FOREIGN KEY constraint, use the following SQL

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

## CHECK Constraint
# The CHECK constraint is used to limit the value range that can be placed in a column.
# If you define a CHECK constraint on a column it will allow only certain values for this column.
# If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.

# CHECK on CREATE TABLE
DROP TABLE Persons;

CREATE TABLE Person (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

## CHECK constraint on multiple columns
DROP TABLE Person;
CREATE TABLE Person (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);


# CHECK on ALTER TABLE
ALTER TABLE Person
ADD CHECK (Age>=18);

# DROP CONSTRAINT
ALTER TABLE Person
DROP CHECK CHK_Person;

## DEFAULT Constraint
# The DEFAULT constraint is used to set a default value for a column.
#The default value will be added to all new records, if no other value is specified.

## DEFAULT on CREATE TABLE
DROP TABLE Person;
CREATE TABLE Person (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

## DEFAULT on ALTER TABLE

ALTER TABLE Person
ALTER City SET DEFAULT 'Sandnes';

## DROP a DEFAULT Constraint

ALTER TABLE Person
ALTER City DROP DEFAULT;

## CREATE INDEX Statement
# The CREATE INDEX statement is used to create indexes in tables.

CREATE INDEX idx_lastname
ON Person (LastName);

CREATE INDEX idx_pname
ON Person (LastName, FirstName);

## DROP INDEX Statement
# The DROP INDEX statement is used to delete an index in a table.

ALTER TABLE Person
DROP INDEX idx_pname ;

## AUTO INCREMENT Field
# Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

DROP TABLE Person;

CREATE TABLE Person (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);

ALTER TABLE Person AUTO_INCREMENT=100;

INSERT INTO Person (FirstName,LastName)
VALUES ('Lars','Monsen');

SELECT * FROM Person ;


















