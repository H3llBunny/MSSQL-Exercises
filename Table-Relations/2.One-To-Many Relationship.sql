CREATE TABLE Manufacturers
(
	ManufacturerID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(50) NOT NULL,
	EstablishedOn DATE NOT NULL
)

CREATE TABLE Models
(
	ModelID INT PRIMARY KEY IDENTITY(100,1),
	Name VARCHAR(50) NOT NULL,
	ManufacturerID INT,
	FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)