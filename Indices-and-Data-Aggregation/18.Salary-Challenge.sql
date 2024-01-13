WITH AverageSalaryPerDepartment AS (
SELECT
	DepartmentID,
	AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
)
SELECT 
	e.FirstName,
	e.LastName,
	e.DepartmentID
FROM Employees e
JOIN AverageSalaryPerDepartment asd ON e.DepartmentID = asd.DepartmentID
WHERE 
	e.Salary > asd.AverageSalary
