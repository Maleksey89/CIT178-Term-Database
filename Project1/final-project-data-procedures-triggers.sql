/*USE maxCarsSales;
GO
SELECT * FROM Vehicles; 

USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 9800.00, AuctionFee=980.00
WHERE VehID = 3010;

SELECT * FROM Vehicles;

SELECT * FROM Vehicles
ORDER BY BidPrice;

USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 75000.00, AuctionFee=7500.00
WHERE VehID = 3008;



UPDATE Vehicles
SET SupplierID= 207, Year = 2012, Model= 'R350' ,VIN = 'WDVHJ0EB3RT568743'
WHERE VehID = 3013;




USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 1390.00, AuctionFee=400.00
WHERE VehID = 3004;
SELECT * FROM Vehicles
ORDER BY BidPrice DESC;

USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 3500.00, AuctionFee=500.00
WHERE VehID = 3005;
SELECT * FROM Vehicles
ORDER BY BidPrice DESC;

USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 10500.00, AuctionFee=1050.00
WHERE VehID = 3003;
SELECT * FROM Vehicles
ORDER BY BidPrice DESC;

USE maxCarsSales;
GO
UPDATE Vehicles
SET BidPrice = 19500.00, AuctionFee=1950.00
WHERE VehID = 3001;
SELECT * FROM Vehicles
ORDER BY BidPrice DESC;


wanted to update the Buyers table to make a null company name column,

USE maxCarsSales;
ALTER TABLE Vehicles
DROP CONSTRAINT FK_BuyerID; 
DROP TABLE Buyers;

Had to remove FK constraint on Vehicles table, then drop table


CREATE TABLE Buyers(
	BuyerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20)NOT NULL,
	Company varchar(30) NULL,
	Address varchar(30)NOT NULL,
	Zipcode varchar(10)NOT NULL,
	BuyerType varchar(15) NOT NULL,
	PRIMARY KEY(BuyerID)
);
Created the new table just like I liked it


--added the FK back--

INSERT INTO Buyers VALUES 
(4001,'Dave','Patterson', NULL ,'456 KENT ST','48060','Individual'),
(4002,'Ben','Charles', NULL ,'7889 Haven ST','48126','Individual'),
(4003,'Gene','Williams','Akron Auto Sales','5679 Superior Ave','44307','Dealer'),
(4004,'Frank','Worm','Lorain Auto Dealer','471 Lorain ave','44111','Dealer'),
(4005,'Chuck','Santos', NULL ,'8914 IL-50','60549','Dealer'),
(4006,'Sandy','Ericcson', NULL ,'5642 E 62nd ST','46220','Individual'),
(4007,'Steven','Darnold', NULL ,'451 College Ave','49503','Individual'),
(4008,'Deb','Corey','Cadillac Motors','S Mitchell St','49601','Dealer');


SELECT * FROM Buyers;
Data Entry and verification



ALTER TABLE Vehicles WITH CHECK
ADD CONSTRAINT FK_BuyerID FOREIGN KEY(BuyerID) REFERENCES Buyers(BuyerID)
ON UPDATE CASCADE;

--added the FK back--

SELECT FirstName, LastName, Company, Year, Make, Model, BidPrice, AuctionFee
FROM Vehicles
JOIN Buyers ON Vehicles.BuyerID = Buyers.BuyerID
ORDER BY FirstName;

--verified that FK constraint works--

USE maxCarsSales;
GO
INSERT INTO ZipCode VALUES(49685,'Traverse City', 'MI')



USE maxCarsSales;
GO
ALTER TABLE Buyers
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(Zipcode) REFERENCES ZipCode(Zipcode)
ON UPDATE CASCADE;

--Had to add the FK to ZipCode but had to add New Zip that was updated later into the ZipTable--


USE maxCarsSales;
GO
DROP VIEW dealerBuyers, dealerBuyers_limited
GO


USE maxCarsSales;
GO
CREATE VIEW dealerBuyers
AS
SELECT *
FROM Buyers
WHERE BuyerType IN('Dealer');

SELECT * FROM dealerBuyers;


USE maxCarsSales;
GO
CREATE VIEW dealerBuyers_limited
AS
SELECT *
FROM Buyers
WHERE BuyerType IN('Dealer')
WITH CHECK OPTION;
GO
SELECT * FROM dealerBuyers_limited;

-- Had to redo views for the buyer table--

--Now the Fun Stuff-- 
--Final Project Procedures-- 

Pulls Vehicle Table

USE maxCarsSales;
GO
CREATE PROC pullVeh
AS
SELECT * FROM Vehicles
ORDER BY SaleDate DESC;
GO

EXEC pullVeh;


Pulls individual Vehicle Record Based on VehID
USE maxCarsSales;
GO
CREATE PROC singleVeh
		@VehID int
AS
BEGIN
	SELECT * FROM Vehicles
	WHERE VehID = @VehID;
END
GO

EXEC singleVeh 3009


USE maxCarsSales;
GO
CREATE PROC buyerInfo
		@BuyerID INT,
		@FirstName nvarchar(20) OUTPUT,
		@LastName nvarchar(20)  OUTPUT,
		@BuyerType nvarchar(20) OUTPUT
AS
SELECT @FirstName = FirstName, @LastName = LastName, @BuyerType=BuyerType
FROM Buyers
WHERE BuyerID=@BuyerID;
GO

DECLARE @FirstName nvarchar(20);
DECLARE @LastName nvarchar(20);
DECLARE @BuyerType nvarchar(20);
EXEC buyerInfo 4003,  @FirstName OUTPUT, @LastName OUTPUT, @BuyerType OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @BuyerType AS 'Buyer Type'; 

Using Return Value
Returns Total Income for the Vehicles Table based on Sum of Auction Fees
USE maxCarsSales;
GO
CREATE PROC spprofit_
AS
DECLARE @Profit int;
SELECT @Profit= SUM(AuctionFee)
FROM Vehicles
WHERE AuctionFee IS NOT NULL
RETURN @Profit;
GO

DECLARE @Profit int;
EXEC @Profit = spprofit;
PRINT 'Your Current profit is $' + CONVERT(varchar,@Profit);
GO

User Defined Functions 


Function that Finds buyer record based on first name
USE maxCarsSales;
GO
CREATE FUNCTION fnBuyerID_
	(@BuyerFName varchar(20))
	RETURNS int
BEGIN
	RETURN(SELECT BuyerID FROM Buyers WHERE FirstName=@BuyerFName);
END;
GO
SELECT BuyerID,FirstName, LastName, Company
FROM Buyers
WHERE BuyerID= dbo.fnBuyerID('Chuck');

Function that Searches Vehicle table for entry based on Partial Vin
USE maxCarsSales;
GO
CREATE FUNCTION fnVINFinder_
	(@VinPart varchar(10) = '%' )
	RETURNS table
RETURN
	(SELECT * FROM Vehicles WHERE VIN LIKE @VinPart);
GO


SELECT * FROM dbo.fnVINFinder('%290001%');
SELECT * FROM dbo.fnVINFinder('%001%');
SELECT * FROM dbo.fnVINFinder('%cgg0%');

--Final Project Triggers --
--CREATE Transaction Table--
USE maxCarsSales;
GO
SELECT * INTO BuyerTesting
FROM Buyers;
-- ADDED Change variable -- 
USE maxCarsSales;
GO
ALTER TABLE BuyerTesting
ADD ChangeState varchar(50);
GO


USE maxCarsSales;
GO
TRUNCATE TABLE BuyerTesting;

-- create trigger for insert

CREATE TRIGGER BuyerTesting_INSERT ON Buyers
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @BuyerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Company nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zipcode nvarchar(20)
	DECLARE @BuyerType nvarchar(30)
SELECT @BuyerID =INSERTED.BuyerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName, @Company = INSERTED.Company,
	@Address = INSERTED.Address, @Zipcode = INSERTED.Zipcode, @BuyerType = INSERTED.BuyerType
	FROM INSERTED
INSERT INTO BuyerTesting VALUES(@BuyerID,@FirstName, @LastName,@Company, @Address, @Zipcode, @BuyerType, 'Inserted' )
END
GO
--adding values to test-- 
USE maxCarsSales;
GO
INSERT INTO Buyers VALUES(4009, 'Garth', 'Bailey',NULL,'154 Frank ST', 49685,'Individual');
GO

--testing insert trigger
SELECT * FROM BuyerTesting;
GO

-- DELETE TRIGGER--

CREATE TRIGGER BuyerTesting_DELETE ON Buyers
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @BuyerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Company nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zipcode nvarchar(20)
	DECLARE @BuyerType nvarchar(30)
SELECT @BuyerID=DELETED.BuyerID, @FirstName = DELETED.FirstName, @LastName = DELETED.LastName, @Company = DELETED.Company,
	@Address = DELETED.Address, @Zipcode = DELETED.Zipcode, @BuyerType = DELETED.BuyerType
	FROM DELETED
INSERT INTO BuyerTesting VALUES(@BuyerID,@FirstName, @LastName,@Company, @Address, @Zipcode, @BuyerType, 'DELETED' )
END
GO

USE maxCarsSales;
GO
DELETE FROM Buyers WHERE BuyerID=4009;
GO
SELECT * FROM BuyerTesting;
--Create Update Trigger --

CREATE TRIGGER BuyerTesting_UPDATE ON Buyers
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @BuyerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Company nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zipcode nvarchar(20)
	DECLARE @BuyerType nvarchar(30)
SELECT @BuyerID =INSERTED.BuyerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName, @Company = INSERTED.Company,
	@Address = INSERTED.Address, @Zipcode = INSERTED.Zipcode, @BuyerType = INSERTED.BuyerType
	FROM INSERTED
INSERT INTO BuyerTesting VALUES(@BuyerID,@FirstName, @LastName,@Company, @Address, @Zipcode, @BuyerType, 'UPDATED' )
END

GO

--ADD Value and Update it to test Insert and Update triggers--

USE maxCarsSales;
GO
INSERT INTO Buyers VALUES(4009, 'Garth', 'Bailey',NULL,'154 Frank ST', 49685,'Individual');
GO

UPDATE Buyers
SET Company = 'GSales', BuyerType='Dealer'
WHERE BuyerID= 4009;
GO
SELECT * FROM BuyerTesting;
*/