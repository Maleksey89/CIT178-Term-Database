/*CREATE DATABASE maxCarsSales;
GO

USE maxCarsSales;
CREATE TABLE ZipCode(
Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)
);

CREATE TABLE Managers(
	ManagerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Employees int NOT NULL,
	PRIMARY KEY(ManagerID)
);

CREATE TABLE SalesYard(
	YardID int NOT NULL,
	ManagerID int NOT NULL,
	YardName varchar(20),
	Street varchar(50),
	Zipcode varchar(10),
	PRIMARY KEY(YardID)
);
CREATE TABLE Suppliers(
	SupplierID int NOT NULL,
	Name varchar(20) NOT NULL,
	Address varchar(50) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	PhoneNum varchar(15),
	SupplierType varchar (20) NOT NULL,
	PRIMARY KEY(SupplierID),
);
CREATE TABLE Buyers(
	BuyerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20)NOT NULL,
	Address varchar(30)NOT NULL,
	Zipcode varchar(10)NOT NULL,
	BuyerType varchar(15) NOT NULL,
	PRIMARY KEY(BuyerID)
);
CREATE TABLE Vehicles(
	VehID int NOT NULL,
	YardID int NOT NULL,
	SupplierID int NOT NULL,
	BuyerID int,
	Year varchar(4) NOT NULL,
	Make varchar(15) NOT NULL,
	Model varchar(20) NOT NULL,
	VIN varchar(20) NOT NULL,
	SaleDate date,
	BidPrice money,
	AuctionFee money,
	PRIMARY KEY(VehID)
);
ALTER TABLE SalesYard WITH CHECK
ADD CONSTRAINT FK_ManagerID FOREIGN KEY (ManagerID) REFERENCES Managers(ManagerID)
ON UPDATE CASCADE
GO
ALTER TABLE Suppliers WITH CHECK
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)

USE maxCarsSales
ALTER TABLE Vehicles WITH CHECK
ADD CONSTRAINT FK_YardID FOREIGN KEY(YardID) REFERENCES SalesYard(YardID) 
ON UPDATE CASCADE

ALTER TABLE Vehicles WITH CHECK
ADD CONSTRAINT FK_SupplierID FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID)
ON UPDATE CASCADE

ALTER TABLE Vehicles WITH CHECK
ADD CONSTRAINT FK_BuyerID FOREIGN KEY(BuyerID) REFERENCES Buyers(BuyerID)
ON UPDATE CASCADE

USE maxCarsSales
ALTER TABLE Buyers
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(Zipcode) REFERENCES ZipCode(Zipcode)
ON UPDATE CASCADE

ALTER TABLE Suppliers WITH CHECK
ADD CONSTRAINT FK_Zipcode_Suppliers FOREIGN KEY(Zipcode) REFERENCES ZipCode(Zipcode)
ON UPDATE NO ACTION

ALTER TABLE SalesYard WITH CHECK
ADD CONSTRAINT FK_Zipcode_SalesYard FOREIGN KEY(Zipcode) REFERENCES ZipCode(Zipcode)
ON UPDATE NO ACTION

CREATE INDEX  idx_YardID ON Vehicles(YardID);

CREATE INDEX idx_Managers_SalesYard on SalesYard(ManagerID);
GO
CREATE INDEX idx_Zipcode_SalesYard ON SalesYard(Zipcode);

CREATE INDEX idx_Zipcode_Buyers ON Buyers(Zipcode);
GO
CREATE INDEX idx_Zipcode_Suppliers ON Suppliers(Zipcode);
GO
CREATE INDEX idx_YardID_Vehicles ON Vehicles(YardID);
GO
CREATE INDEX idx_YardID_SupplierID ON Vehicles(SupplierID);
GO
CREATE INDEX idx_YardID_BuyerID ON Vehicles(BuyerID);
GO*/

