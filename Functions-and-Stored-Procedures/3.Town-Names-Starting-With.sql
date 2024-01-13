CREATE PROC dbo.usp_GetTownsStartingWith (@TownName VARCHAR(MAX))
AS
	SELECT
		Name AS Town
	FROM Towns
	WHERE Name LIKE '@TownName' + '%'