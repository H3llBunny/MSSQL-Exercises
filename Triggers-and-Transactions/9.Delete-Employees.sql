CREATE TABLE Deleted_Employees (
    EmployeeId INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(50),
    JobTitle VARCHAR(50),
    DepartmentId INT,
    Salary DECIMAL(10, 2)
);

GO

CREATE TRIGGER tr_Employees_Delete
ON Employees
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Deleted_Employees (EmployeeId, FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
    SELECT
        EmployeeId,
        FirstName,
        LastName,
        MiddleName,
        JobTitle,
        DepartmentId,
        Salary
    FROM DELETED;
END;