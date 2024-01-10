CREATE DATABASE CarRental;

GO

USE CarRental;

GO

CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	CategoryName VARCHAR(100) NOT NULL,
	DailyRate DECIMAL(10,2),
	WeeklyRate DECIMAL(10,2),
	MonthlyRate DECIMAL(10,2),
	WeekendRate DECIMAL(10,2)
)

CREATE TABLE Cars
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	PlateNumber VARCHAR(10) NOT NULL,
	Manufacturer VARCHAR(50) NOT NULL,
	Model VARCHAR(50) NOT NULL, 
	CarYear INT NOT NULL, 
	CategoryId INT, 
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	Doors INT NOT NULL, 
	Picture VARBINARY(MAX) NULL, 
	Condition VARCHAR(50) NOT NULL, 
	Available VARCHAR(3) NOT NULL CHECK (Available IN ('Yes', 'No'))
)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR (50) NOT NULL, 
	LastName VARCHAR (50) NOT NULL, 
	Title VARCHAR (MAX) NOT NULL, 
	Notes VARCHAR (MAX) NULL
)

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	DriverLicenceNumber INT NOT NULL, 
	FullName  VARCHAR (50) NOT NULL, 
	Address NVARCHAR(200) NOT NULL, 
	City VARCHAR(100) NOT NULL, 
	ZIPCode VARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX) NULL
)

CREATE TABLE RentalOrders
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	EmployeeId INT, 
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	CustomerId INT, 
	FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
	CarId INT, 
	FOREIGN KEY (CarId) REFERENCES Cars(Id),
	TankLevel DECIMAL(5,2) NOT NULL, 
	KilometrageStart INT NOT NULL, 
	KilometrageEnd INT NOT NULL, 
	TotalKilometrage INT NOT NULL, 
	StartDate DATETIME NOT NULL, 
	EndDate DATETIME NOT NULL, 
	TotalDays INT NOT NULL, 
	RateApplied DECIMAL(10,2) NOT NULL, 
	TaxRate DECIMAL(5,2) NOT NULL, 
	OrderStatus NVARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX) NULL
)