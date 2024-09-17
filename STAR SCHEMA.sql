-- DATA CLEANING
-- TABLE TO CLEAN :  Adventureworks_customers
-- Removing the dollar sign in front of Annualincome values
Update AdventureWorks_Customers set AnnualIncome = replace(AnnualIncome, '$', ' ');
-- Replacing Empty rows in prefix column with (No value) 
update AdventureWorks_Customers set Prefix = 'No value' where prefix is null;

-- Create a data star schema with relationships between tables
-- Data Star Schema Procedures:  Tables to create star schema we will be needing (Fact Table, Dimension Table (fact tables are the sales table for 2015,2016,2017 and returns table))
-- AVAILABLE TABLES TO BE USE FOR STAR SCHEMA
-- AdventureWorks_Customers,AdventureWorks_Product_Categories, AdventureWorks_Product_Subcategories, AdventureWorks_Products, AdventureWorks_Returns, AdventureWorks_Territories,
-- AdventureWorks_Calendaar, AdventureWorks_Sales_2015, AdventureWorks_Sales_2016, AdventureWorks_Sales_2017

-- Adding relationships to the tables
alter table AdventureWorks_Products add primary key (ProductKey);
alter table AdventureWorks_Product_Categories add primary key (ProductCategoryKey);
alter table AdventureWorks_Product_Subcategories add PRIMARY key (ProductSubcategoryKey);
alter table AdventureWorks_Customers add PRIMARY key (CustomerKey);
ALTER table AdventureWorks_Territories add PRIMARY key (SalesTerritoryKey);

-- AdventureWorks_Returns does not have a unique key so we'll add index to make it UNIQUE 
create table Adv_Returns(
ReturnIndex int primary key AUTO_INCREMENT,
ReturnDate text,
TerritoryKey int,
ProductKey int,
ReturnQuantity int );

insert into Adv_Returns(ReturnDate,TerritoryKey,ProductKey,ReturnQuantity) 
	select (ReturnDate,TerritoryKey,ProductKey,ReturnQuantity) 
from AdventureWorks_Returns;

-- Joining the three tables Adventureworks_Sales_2015, Adventureworks_Sales_2016, Adventureworks_Sales_2017 together and make it fact table to create star schema 
CREATE TABLE Fact_Sales as SELECT * from AdventureWorks_Sales_2015 union SELECT * from AdventureWorks_Sales_2016 UNION SELECT * from AdventureWorks_Sales_2017;
-- this will generate a new table and the table is represented as our fact table 

-- joining the tables together using foreign key 
-- sql queries to join tables togeteher
-- SELECT OrderDate, count(*) from Fact_Sales group by OrderDate HAVING count(*) > 1;
alter table Fact_Sales add foreign key (ProductKey) REFERENCES AdventureWorks_Products(ProductKey);
alter table Fact_Sales add foreign key (CustomerKey) REFERENCES AdventureWorks_Customers(CustomerKey);
alter table Fact_Sales add foreign key (TerritoryKey) REFERENCES AdventureWorks_Territories(SalesTerritoryKey);

alter table AdventureWorks_Products add foreign key (ProductSubcategoryKey) REFERENCES AdventureWorks_Product_Subcategories (ProductSubcategoryKey);
alter table AdventureWorks_Product_Subcategories add foreign key (ProductCategoryKey) REFERENCES AdventureWorks_Product_Categories(ProductCategoryKey);

alter table Adv_Returns add foreign key (ProductKey) REFERENCES AdventureWorks_Products(ProductCategoryKey);
alter table Adv_Returns add foreign key (TerritoryKey) REFERENCES AdventureWorks_Territories(SalesTerritoryKey);

-- STAR SCHEMA
-- FACT TABLE: Fact_Sales
-- DIMENSION TABLES: 
-- AdventureWorks_Customers
-- AdventureWorks_Product_Categories
-- AdventureWorks_Product_Subcategories
-- AdventureWorks_Products
-- Adv_Returns
-- AdventureWorks_Territories
-- DimCalendar

-- splitting the calendar COLUMN
CREATE TABLE DimCalendar(
	OrderDate TEXT,
	Year TEXT,
	Month TEXT,
	PRIMARY KEY (OrderDate)
);

INSERT INTO DimCalendar(OrderDate, Year, Month)
SELECT Date,
	CAST(substr(Date, -4, 4) as int) as Year,
	CAST(substr(Date, 1, 2) as int) as Month
FROM AdventureWorks_Calendar;
alter table Fact_Sales add foreign key (OrderDate) REFERENCES Fact_Sales(OrderDate);