CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
	BEGIN TRY
		BEGIN TRANSACTION
			EXEC dbo.usp_WithdrawMoney @SenderId, @Amount;
			EXEC dbo.usp_DepositMoney @ReceiverId, @Amount;

			COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW;
	END CATCH
