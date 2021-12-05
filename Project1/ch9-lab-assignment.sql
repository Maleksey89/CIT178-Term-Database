/* Task 1  List of Vehicles Not Sold yet
USE maxCarsSales;
SELECT RIGHT(Year, 2) + ' ' + Make + ' ' + LEFT(Model, 3)+'.' AS Vehicle, BidPrice
FROM Vehicles
WHERE SaleDate IS NULL;

List of abbrev Name of Managers Yard they manage and number of employees

USE maxCarsSales;
SELECT LEFT(FirstName, 1) + '.' + ' ' + LastName AS ManagerName, Employees, YardName
FROM Managers
JOIN SalesYard ON Managers.ManagerID=SalesYard.ManagerID;


Task 2 
Generates a random buyer, forgot I had made them in the 4000's, 
all I had to do was add 4000 to the number generated and it worked 

USE maxCarsSales;
SELECT *
FROM Buyers
WHERE BuyerID =CEILING(RAND(CHECKSUM(NEWID()))*8)+4000;


USE Northwind;
SELECT ProductName, SUM(ROUND(UnitPrice*UnitsInStock,0)) AS [Potential Sales]
FROM Products
GROUP BY ProductName;

Task 3

USE maxCarsSales;
Select  RIGHT(Year, 2) + ' ' + Make + ' ' + Model AS Vehicle, BidPrice,
MONTH(SaleDate) AS 'Month Sold', DAY(SaleDate) AS 'Day Sold'
FROM Vehicles;

USE maxCarsSales;
SELECT *
FROM Vehicles
WHERE MONTH(SaleDate) = 09 AND DAY(SaleDate) = 17 AND YEAR(SaleDate)=2021;

Task 4

USE Northwind;
SELECT ProductName, Discontinued,
CASE Discontinued
WHEN 1 THEN 'This Product is no longer available'
WHEN 0 THEN 'This Product is still available'
END AS 'Availability'
FROM Products;


USE maxCarsSales;
SELECT Name, VehId, BidPrice,AuctionFee, IIF(AuctionFee>3000,'Premium Purchase','Regular Purchase') AS 'Purchase Grade'
FROM Buyers
JOIN Vehicles ON Buyers.BuyerID = Vehicles.BuyerID
GROUP BY Name,VehID,BidPrice,AuctionFee;

USE Northwind;
SELECT ProductName, 
CHOOSE(RIGHT(CategoryID,1),'Drink','Condiments','Sweets', 'Cheese','Grains','Meat','Produce', 'Seafood', 'NA') AS 'Product Type'
FROM Products;

Task 5

USE Northwind;
SELECT CASE
	   WHEN GROUPING(ProductName) = 1 THEN 'Total Potential Sales'
	   ELSE ProductName
	   END AS ProductName,
	   SUM(UnitPrice*UnitsInStock) AS [Potential Sales]
FROM Products
GROUP BY ProductName WITH ROLLUP;

USE maxCarsSales
SELECT VehID, Year, Make, Model, VIN, ISNULL(BidPrice,0.00) AS BidPrice, ISNULL(AuctionFee,0.00) AS AuctionFee
FROM Vehicles*/