CREATE PROC [dbo].[usp_DeleteEmployeesFromDepartment](@departmentId INT)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE EmployeesProjects
    SET EmployeeID = NULL
    WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId);

    UPDATE Employees
    SET DepartmentID = NULL
    WHERE DepartmentID = @departmentId;

    UPDATE Departments
    SET ManagerID = NULL
    WHERE ManagerID = @departmentId;

    DELETE FROM Employees WHERE DepartmentID = @departmentId;

    DELETE FROM Departments WHERE DepartmentID = @departmentId;

    SELECT COUNT(*) AS NumberOfEmployees
    FROM Employees
    WHERE DepartmentID = @departmentId;
END
