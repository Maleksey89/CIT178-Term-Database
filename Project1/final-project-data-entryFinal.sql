/*USE maxCarsSales;
GO
INSERT INTO ZipCode VALUES 
('02116','Boston','MA'),
('07054','Parsppany','NJ'),
('20815','Chevy Chase','MD'),
('33928','Estero','FL'),
('43065','Powell','OH'),
('44067','NORTHFIELD','OH'),
('44143','Mayfield','OH'),
('46224','Eagledale','IN'),
('48214','Detroit','MI'),
('48911','Lansing','MI'),
('60062','Northbrook','IL'), 
('60124','Elgin','IL'),
('61710','Bloomington','IL'), 
('63105','St. Louis','MO'),
('63134','St. Louis','MO'),
('91367','Woodland','CA');

INSERT INTO Managers VALUES
(10,'John','Fargo',18),
(12,'Mike','Sanches',21),
(13,'Charles','Front',25),
(15,'Sarah','Burgess',20),
(17,'Eddie','Mantic',20),
(19,'Jennifer','Saint',13),
(0, 'Eric','Brown',16);

INSERT INTO SalesYard VALUES
(101,10,'Detroit', '1225 Warren','48214'),
(102,12,'Cleveland','5687 TWINSBURG','44067'),
(103,19,'Lansing','131 W Miller Rd','48911'),
(104,13,'Chicago','6572 Nesler rd','60124'),
(105,17,'Indianapolis','253 Moller RD','46224'),
(106,15,'Columbus','9853 Liberty St','43065'),
(107,0,	'Corporate','1223 Warren',	'48214');

INSERT INTO Suppliers VALUES
(100,'Progressive','4568 Main st','44143','440-395-2222','Insurance Company'),
(106,'State Farm','1 State Farm Plaza','61710','309-766-2311','Insurance Company'),
(107,'Gieco','5062 West Ave','20815','800-841-3000','Insurance Company'),
(108,'Allstate','7775 Sanders','60062','847-402-5000','Insurance Company'),
(109,'Farmers','6310 Owens Ave','91367','323-932-3200','Insurance Company'),
(110,'Liberty Mutual','175 Berkely','02116','617-357-9500','Insurance Company'),
(201,'Hertz','8105 Williams','33928','239-301-7000','Car Rental Company'),
(205,'Avis','6 Sylvan','07054','973-496-3500','Car Rental Company'),
(206,'Enterprise','060 Corporate dr','63105','569-456-9326','Car Rental Company'),
(207,'National Car','11024 Natural Bridge','63134','844-370-9180','Car Rental Company');



INSERT INTO ZipCode VALUES
('48060','Port Huron','MI'),
('48126','Dearborn','MI'),
('44307','Akron','OH'),
('44111','Cleveland','OH'),
('60549','Serena','IL'),
('46220','Indianapolis','IN'),
('49503','Grand Rapids','MI'),
('49601','Cadillac','MI');

INSERT INTO Buyers VALUES 
(4001,'Dave Patterson','456 KENT ST','48060','Individual'),
(4002,'Ben Charles','7889 Haven ST','48126','Individual'),
(4003,'Akron Auto Sales','5679 Superior Ave','44307','Dealer'),
(4004,'Lorain Auto Dealer','471 Lorain ave','44111','Dealer'),
(4005,'Chuck Santos','8914 IL-50','60549','Dealer'),
(4006,'Sandy Ericcson','5642 E 62nd ST','46220','Individual'),
(4007,'Steven Darnold','451 College Ave','49503','Individual'),
(4008,'Cadillac Motors','S Mitchell St','49601','Dealer');
USE maxCarsSales
GO
INSERT INTO Vehicles VALUES
('3001','103','100','4008','2019','Honda','Pilot','WERS23451FGR32123','9/17/2021','1,250.00','300.00'),
('3002','102','107','4006','2015','Acura','TSX','484687687SADF','9/21/2021','17,500.00','1,750.00'),
('3003','106','108','4005','2010','Land Rover','LR2','ASDS486468FDASDF746','9/8/2021','900.00','200.00'),
('3004','106','201','4001','2004','Infiniti','M45','D4DFG874ASDF84FQ','9/22/2021','13,900.00','1,390.00'),
('3005','101','206','4003','2006','Toyota','Camry','F22DW292F9TTE418S','9/22/2021','12,000.00','1,200.00'),
('3006','104','100','4007','2016','Lexus','RX450','SADF548568FSDF13','9/13/2021','7,800.00','800.00'),
('3007','101','110','4004','2008','Chevrolet','Corvette','F546S54FERAS215F','9/29/2021','18,000.00','1,800.00'),
('3008','105','205','4008','1998','Ferrari','F355','TRYASD484ASD846AS8','9/27/2021','7,500.00','800.00'),
('3009','102','106','4003','2012','Ford','F150','AGDR5121F784A4FA4F','9/7/2021','13,700.00','1,370.00'),
('3010','104','207','4008','2014','Subaru','Forester','BVA65A95RE94654SDF','9/7/2021','98,000.00','9,800.00'),
('3011','103','201','4004','2017','Ford','Edge','2FMPK3K87HBB123571','9/17/2021','12,500.00','1,250.00'),
('3012','102','100','4002','2006','Lexus','GS300','JTHCH96S260012953','10/10/2021','4,100.00','550.00');
SELECT * FROM Vehicles;

INSERT INTO Vehicles VALUES
('3013','101','108',NULL,'2015','Mercedes','GL250','WDCGG0EB3FG367328',NULL,NULL,NULL),
('3014','101','108',NULL,'2015','Mercedes','GL250','WDCGG0EB3FG367328',NULL,NULL,NULL),
('3015','107','206',NULL,'2013','Ford','Focus','1FADP3N2XDL131116',NULL,NULL,NULL),
('3016','105','107',NULL,'2005','BMW','330i','WBAEV53405KM90735',NULL,NULL,NULL),
('3017','104','109',NULL,'2017','AUDI','A8','WAU43AFD8HN002678',NULL,NULL,NULL),
('3018','106','205',NULL,'2019','SUBARU','WRX','JF1VA2V67K98290001',NULL,NULL,NULL);
SELECT * FROM Vehicles;

*/