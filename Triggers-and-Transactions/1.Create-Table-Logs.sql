CREATE TABLE Logs
(
	LogId INT PRIMARY KEY IDENTITY,
	AccountId INT NOT NULL REFERENCES Accounts(Id),
	OldSum MONEY NOT NULL,
	NewSum MONEY NOT NULL
)
GO

CREATE TRIGGER tr_AddToLogsOnBalanceUpdate
ON Accounts FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT
		i.Id,
		d.Balance,
		i.Balance
	FROM inserted i
	JOIN deleted d ON i.Id = d.Id
	WHERE i.Balance != d.Balance
GO