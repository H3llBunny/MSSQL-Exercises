WITH RankedSalaries AS (
SELECT
	DepartmentID,
	Salary,
	DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS SalaryRank
FROM Employees
)
SELECT DISTINCT
	DepartmentID,
	Salary
FROM RankedSalaries
WHERE SalaryRank = 3

