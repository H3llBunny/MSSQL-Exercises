CREATE PROC dbo.usp_EmployeesBySalaryLevel(@SalaryLevel VARCHAR(50))
AS
	SELECT
		FirstName,
		LastName
	FROM Employees e
	WHERE EXISTS(
		SELECT 1
		FROM dbo.ufn_GetSalaryLevel(e.Salary) AS SalaryLevels
		WHERE SalaryLevels.[Salary Level] = @SalaryLevel
	)
		