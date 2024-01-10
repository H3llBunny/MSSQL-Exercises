CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX) NULL,
	Height DECIMAL(5,2) NULL,
	Weight DECIMAL(5,2) NULL,
	Gender CHAR(1) NOT NULL CHECK (Gender IN ('m', 'f')),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX) NULL
)

INSERT INTO People(Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
	('Test', NULL, 178, 83, 'm', '1994-05-10', NULL),
	('Test1', NULL, 178, 83, 'm', '1994-05-10', NULL),
	('Test2', NULL, 178, 83, 'm', '1994-05-10', NULL),
	('Test3', NULL, 178, 83, 'm', '1994-05-10', NULL),
	('Test4', NULL, 178, 83, 'm', '1994-05-10', NULL),
	('Test5', NULL, 178, 83, 'm', '1994-05-10', NULL);