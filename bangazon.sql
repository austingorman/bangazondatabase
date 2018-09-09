DELETE FROM TrainingProgram;
DELETE FROM Computers;
DELETE FROM Departments;
DELETE FROM Customer;
DELETE FROM ProductTypes;
DELETE FROM Product;
DELETE FROM Employees;
DELETE FROM Orders;
DELETE FROM PaymentTypes;
DELETE FROM EmployeeComputer;
DELETE FROM OrderProducts;
DELETE FROM EmployeePrograms;

DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS EmployeeComputer;
DROP TABLE IF EXISTS OrderProducts;
DROP TABLE IF EXISTS EmployeePrograms;


CREATE TABLE `Departments` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`DepartmentName` TEXT NOT NULL,
	`Budget` TEXT NOT NULL
);
CREATE TABLE `Customer` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`DateCreated` TEXT NOT NULL,
	`LoginDate` TEXT NOT NULL,
	`ActiveCustomer` BOOLEAN NOT NULL
);
CREATE TABLE `ProductTypes` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Category` TEXT NOT NULL
);
CREATE TABLE `Computers` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`DatePurchased` TEXT NOT NULL,
	`DecommisionDate` TEXT NOT NULL,
	`RepairNeeded` BOOLEAN NOT NULL
);
CREATE TABLE `TrainingProgram` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ProgramName` TEXT NOT NULL,
	`StartDate` TEXT NOT NULL,
	`EndDate` TEXT NOT NULL,
	`MaxAttendees` INTEGER NOT NULL 
);
CREATE TABLE `PaymentTypes` (
	`Id`   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PaymentType` TEXT NOT NULL,
	`AccountNo` INTEGER NOT NULL,
	`CustomerID` INTEGER NOT NULL,
	 FOREIGN KEY(`CustomerID`) REFERENCES `Customer` (`Id`)
);
CREATE TABLE `Orders` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderName` TEXT NOT NULL,
	`CustomerID` INTEGER NOT NULL,
	`PaymentTypesID` INTEGER NOT NULL,
	FOREIGN KEY(`CustomerID`) REFERENCES `Customer` (`Id`),
	FOREIGN KEY(`PaymentTypesID`) REFERENCES `PaymentTypes`(`Id`)
);
CREATE TABLE `Product` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Price` TEXT NOT NULL,
	`Title` TEXT NOT NULL,
	`Description` TEXT NOT NULL,
	`Quantity` INTEGER NOT NULL ,
	`CustomerID` INTEGER NOT NULL,
	`ProductTypeID` INTEGER NOT NULL,
	FOREIGN KEY(`CustomerID`) REFERENCES `Customer`(`Id`),
	FOREIGN KEY(`ProductTypeID`) REFERENCES `ProductTypes`(`Id`)
);
CREATE TABLE `Employees` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeName` TEXT NOT NULL,
	`SupervisorName` TEXT NOT NULL,
	`DepartmentID` INTEGER NOT NULL,
	FOREIGN KEY(`DepartmentID`) REFERENCES `Departments`(`Id`)
);
CREATE TABLE `EmployeeComputer` (
`Id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeID` INTEGER NOT NULL,
	`ComputerID` INTEGER NOT NULL,
	FOREIGN KEY(`EmployeeID`) REFERENCES `Employees`(`Id`),
	FOREIGN KEY(`ComputerID`) REFERENCES `Computers`(`Id`)
);
CREATE TABLE `OrderProducts` (
`Id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderID` INTEGER NOT NULL,
	`ProductsID` INTEGER NOT NULL,
	FOREIGN KEY(`OrderID`) REFERENCES `Orders`(`Id`),
	FOREIGN KEY(`ProductsID`) REFERENCES `Product`(`Id`)
);
CREATE TABLE `EmployeePrograms` (
`Id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeID` INTEGER NOT NULL,
	`TrainingProgramsID` INTEGER NOT NULL,
	FOREIGN KEY(`EmployeeID`) REFERENCES `Employees`(`Id`),
	FOREIGN KEY(`TrainingProgramsID`) REFERENCES `TrainingProgram`(`Id`)
);


INSERT INTO TrainingProgram
VALUES (null, "Bullfighting", "2018-10-1", "2018-10-5", 5);
INSERT INTO TrainingProgram
VALUES (null, "Cool Stuff", "2018-10-2", "2018-10-9", 4);

INSERT INTO  Computers
VALUES (null, "2018-5-3", "2018-9-8", 0);
INSERT INTO  Computers
VALUES (null, "2018-5-2", "2018-9-1", 1);

INSERT INTO  Departments
VALUES (null, "Administration", 200000.00);
INSERT INTO  Departments
VALUES (null, "Sanitation", 250.00);

INSERT INTO  Customer
VALUES (null, "John", "Wark", 2018-5-6, 2018-8-8, 1);
INSERT INTO  Customer
VALUES (null, "Beth", "Boiydson", 2018-4-6, 2018-8-19, 1);

INSERT INTO  ProductTypes
VALUES (null, "Cool");
INSERT INTO  ProductTypes
VALUES (null, "Dumb");

INSERT INTO  Product
VALUES (null, "2000.00", "iMac", "Desktop computer", 2, 1, 1);
INSERT INTO  Product
VALUES (null, "5000.00", "Big Boy Computer", "Large desktop computer", 2, 1, 1);

INSERT INTO  Employees
VALUES (null, "Helen Powell", "Jim Hall", 1);

INSERT INTO  Orders
VALUES (null, "Big Order", 1, 1);

INSERT INTO  PaymentTypes
VALUES (null, "AMEX", 1232123, 1);

INSERT INTO  EmployeeComputer
VALUES (null, 1, 1);

INSERT INTO  OrderProducts
VALUES (null, 1, 1);

INSERT INTO  EmployeePrograms
VALUES (null, 1, 1);

