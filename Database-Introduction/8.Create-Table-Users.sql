CREATE TABLE Users
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX) NULL,
	LastLoginTime DATETIME NULL,
	IsDeleted VARCHAR(10) NOT NULL CHECK (IsDeleted IN ('true', 'false'))
)

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES 
	('Test', 'Password123', NULL, GETDATE(), 'false'),
	('Test2', 'Password123', NULL, GETDATE(), 'true'),
	('Test3', 'Password123', NULL, GETDATE(), 'false'),
	('Test4', 'Password123', NULL, GETDATE(), 'false'),
	('Test5', 'Password123', NULL, GETDATE(), 'false')