CREATE PROC dbo.usp_GetEmployeesSalaryAboveNumber(@RequredSalary DECIMAL(18,4))
AS
	SELECT
		FirstName,
		LastName
	FROM Employees
	WHERE Salary >= @RequredSalary
	