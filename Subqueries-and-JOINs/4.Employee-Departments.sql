SELECT TOP 5
	e.EmployeeID,
	e.FirstName,
	e.Salary,
	d.Name AS DeparmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE Salary > 15000
ORDER BY d.DepartmentID