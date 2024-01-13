CREATE PROC dbo.usp_GetEmployeesFromTown(@Town VARCHAR(MAX))
AS
	SELECT
		e.FirstName,
		e.LastName
	FROM Employees e
	JOIN Addresses a ON e.AddressID = a.AddressID
	JOIN Towns t ON a.TownID = t.TownID
	WHERE t.Name = @Town