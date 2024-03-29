SELECT TOP 5
	e.EmployeeID,
	e.FirstName,
	p.Name AS ProjectName
FROM EmployeesProjects ep
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE 
	p.StartDate > '2002-08-13' AND
	p.EndDate IS NULL
ORDER BY e.EmployeeID
