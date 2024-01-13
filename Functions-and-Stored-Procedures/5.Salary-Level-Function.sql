CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS TABLE
AS
RETURN
	SELECT
		@salary AS Salary,
		CASE
			WHEN @salary < 30000 THEN 'Low'
			WHEN @salary BETWEEN 30000 AND 50000 THEN 'Average'
			WHEN @salary > 50000 THEN 'High'
		END AS [Salaty Level]
	FROM Employees
