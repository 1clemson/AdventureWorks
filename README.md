# AdventureWorks
### INTRODUCTION
This report analyzes the Adventure Works 2015,2016,2017 dataset to inform business decisions,derive insight and drive growth. Focusing on sales, customers, and products, our analysis identifies key trends and patterns, providing actionable recommendations to enhance operations, customer engagement, and market expansion. SQLITE is use for Analysis and Exploration

**WEEK 1 TASK**

### DATA IMPORTATION

The dataset is a CSV file and importing  files into SQLITE can be quite challenging especially using it for the first time and the date  is not the usual format for the default format that SQL recognizes. https://drive.google.com/drive/folders/1NBVyekPsFIB8Ajb9nhh22WX5eun9NyeW?usp=sharing 


### DATA DICTIONARY

Customer: This table contains information about the customer whcih include CustomerKey	Prefix	FirstName	LastName	BirthDate	MaritalStatus	Gender	EmailAddress	AnnualIcome	TotalChildren	EducationLevel	Occupation	HomeOwner.
 
Product: This table contains information about the product , including ProductKey	ProductSubcategoryKey	ProductSKU	ProductName	ModelName	ProductDescription	ProductColor	ProductSize	ProductStyle	ProductCost	ProductPrice

Territory: This table contains information about sales territories, including SalesTerritoryKey	Region	Country	Continent

Product Categories: This table contains ProductCategoryKey	CategoryName

Product subcategories: This table contains detailed information about ProductSubcategoryKey	,SubcategoryName	,ProductCategoryKey

Returns: This table contains ReturnDate	TerritoryKey	ProductKey	ReturnQuantity

Calendar: This table contains Date

FACTS SALES: This table contains  all the sales data from 2015, 2016 and 2017 respectively and it has the following informations as columns OrderDate	StockDate	OrderNumber	ProductKey	CustomerKey	TerritoryKey	OrderLineItem	OrderQuantity

**##STAR SCHEMA**
The star schema was created by creating relationships between the tables where by joining all the sales data togther (2015,2016,2017) to create fact table and use the other table as dimension table. The table is linked together with Foreign key to create relationships.

### ENTITY RELATIONSHIP DIAGRAM

The Data Diagram also known as Entity Relationship Diagram (ERD or ER Diagram) is a type of flowchart that illustrates how “entities” relate to each other within a system or database. The data Diagram was drawn using Mysql Workbench
![ERDiagram](https://github.com/user-attachments/assets/5ef79121-875e-4671-82a2-f8e32d88f50a)


### INSIGHTS

1. Identify top-selling products and categories.
2. Analyze customer purchasing patterns and preferences.
3. Detect opportunities for product bundling.





****WEEK TWO TASK****

**SQLITE database connection with Python**
Importing pandas as pd, importing Sqlite3 as sql. Connecting the database with python to upload the tables in  dataframe.
Variable name was created for each database parsed in as panadas dataframe for easier use.

## Exploring datasets, data preprocessing, data normalization and data validation
The data was explored to check the datatypes using diffrent python command (describe, info) to check null values, datatypes ,descriptive statistics of the columns.

## Correcting datatypes
The data datatype was corrected using python code to put it in more organized format. Changing annual income datatype to integer from object and also cleaning the column by removing comma (,) sign to make the column organized properly.

## Foreign key check
Checking if the foreign key in fact_sales is linked properly using python code with (if statement) to print out particular statement if the foreign key is linked properly.

## Visualizing outliers 
Boxplot was used to visualize outliers in AnnualIncome column on Customers table, the extreme values was plotted above the whiskers which makes it outliers in the column.

**Importing Pandas and Sqlite**

![week2p](https://github.com/user-attachments/assets/112b0dba-7b76-404b-9988-c118b922fe24)


**Boxplot**
![week2a](https://github.com/user-attachments/assets/baad40db-6b54-4bcb-8008-0a43fe384945)






