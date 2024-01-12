SELECT
	e.EmployeeID,
	e.JobTitle,
	e.AddressID,
	a.AddressText
FROM Employees e
JOIN Addresses a ON e.AddressID = a.AddressID
ORDER BY a.AddressID