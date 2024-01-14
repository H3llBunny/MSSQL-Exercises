CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT) 
AS
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION

				DECLARE @ProjectCountForEmployee INT;
				SELECT @ProjectCountForEmployee = COUNT(*)
				FROM EmployeesProjects ep
				WHERE ep.EmployeeID = @emloyeeId

				IF(@ProjectCountForEmployee < 3)
				BEGIN
					INSERT INTO EmployeesProjects
					VALUES (@emloyeeId, @projectID)

				COMMIT;
		END
		ELSE
		BEGIN
			ROLLBACK;
			THROW 50001, 'The employee has too many projects!', 1;
		END
		END TRY
		 BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW;
    END CATCH
END;