SELECT TOP 3
	e.EmployeeID,
	e.FirstName
FROM EmployeesProjects ep
RIGHT JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID