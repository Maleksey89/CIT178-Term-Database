/* Final Project Views 

Updateable View 

USE maxCarsSales;
GO
CREATE VIEW Insurance_Supp
AS
SELECT * FROM Suppliers
WHERE SupplierType IN('Insurance Company');

SELECT * FROM Insurance_Supp;

UPDATE Insurance_Supp
SET PhoneNum=440-395-2221
WHERE Name='Progressive';

Had to do it twice because the first time it just added the numbers together like a math problem lol

UPDATE Insurance_Supp
SET PhoneNum='440-395-2221'
WHERE Name='Progressive';
GO
SELECT * FROM Insurance_Supp;

USE maxCarsSales;
GO
CREATE VIEW YardFullInfo
AS
SELECT YardID, YardName, FirstName, LastName, Employees
FROM SalesYard
JOIN Managers ON SalesYard.ManagerID = Managers.ManagerID;

SELECT * FROM YardFullInfo;

USE maxCarsSales;
GO
CREATE VIEW notSoldVeh
AS
SELECT *
FROM Vehicles
WHERE SaleDate IS NULL;

SELECT * FROM notSoldVeh;

USE maxCarsSales;
GO
CREATE VIEW dealerBuyers
AS
SELECT *
FROM Buyers
WHERE BuyerType IN('Dealer');

SELECT * FROM dealerBuyers;


Limited View That shows all buyer that are Auto Dealers
USE maxCarsSales;
GO
CREATE VIEW dealerBuyers_limited_
AS
SELECT *
FROM Buyers
WHERE BuyerType IN('Dealer')
WITH CHECK OPTION;

*/





