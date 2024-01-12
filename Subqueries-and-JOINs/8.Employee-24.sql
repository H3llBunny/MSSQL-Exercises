SELECT
	e.EmployeeID,
	e.FirstName,
	CASE
		WHEN DATEPART(YEAR, p.StartDate) >= 2005 THEN NULL
		ELSE p.Name
	END AS ProjectName
FROM EmployeesProjects ep
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
WHERE
	ep.EmployeeID = 24
