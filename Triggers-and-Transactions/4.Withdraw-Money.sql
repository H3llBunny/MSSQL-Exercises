CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	IF @MoneyAmount >= 0 AND @MoneyAmount % 0.0001 = 0
	BEGIN
	UPDATE Accounts
			SET Balance = Balance - @MoneyAmount
			WHERE Id = @SenderId
		IF @@ROWCOUNT <> 1
		BEGIN
			ROLLBACK;
			THROW 50001, 'Invalid account!', 1;
			RETURN;
	END;
	ELSE
		THROW 50000, 'Invalid MoneyAmount. Please provide a valid positive amount with precision up to the fourth decimal place.', 1;
	COMMIT;
END;