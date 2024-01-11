CREATE VIEW V_EmployeeNameJobTitle AS
SELECT
	CONCAT(FirstName, ' ', ISNULL(MiddleName, ''), ' ', LastName) AS [Fill Name],
	JobTitle AS [Job Title]
FROM Employees