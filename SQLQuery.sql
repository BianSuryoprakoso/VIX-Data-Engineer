-- Create New Database
CREATE DATABASE DWH_Project

-- Tabel DimCustomer
CREATE Table DimCustomer(
	CustomerID int NOT NULL,
	CustomerName varchar (50) NOT NULL,
	Age int NOT NULL,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	NoHp varchar (50) NOT NULL ,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
)

-- Tabel DimProduct
CREATE Table DimProduct(
	ProductID int NOT NULL,
	ProductName varchar (50) NOT NULL,
	ProductCategory varchar (50) NOT NULL,
	ProductUnitPrice int NOT NULL
	CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
)

-- Tabel DimStatusOrder
CREATE TABLE DimStatusOrder(
	StatusID int NOT NULL,
	StatusOrder varchar (50) NOT NULL,
	StatusOrderDesc varchar (50) NOT NULL
	CONSTRAINT PK_DimStatusOrder PRIMARY KEY (StatusID)
)

-- Fact Tabel FactSalesOrder
CREATE TABLE FactSalesOrder(
	OrderID int NOT NULL,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	StatusID int NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	OrderDate date NOT NULL
	CONSTRAINT PK_FactSalesOrder PRIMARY KEY (OrderID),
	CONSTRAINT FK_FactSalesOrderC FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID),
	CONSTRAINT FK_FactSalesOrderP FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
	CONSTRAINT FK_FactSalesOrderS FOREIGN KEY (StatusID) REFERENCES DimStatusOrder (StatusID)
)

SELECT * FROM DimCustomer
SELECT * FROM DimProduct
SELECT * FROM DimStatusOrder
SELECT * FROM FactSalesOrder