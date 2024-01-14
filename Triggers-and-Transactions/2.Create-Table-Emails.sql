CREATE TABLE NotificationEmails
(
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL,
	Subject VARCHAR(50) NOT NULL,
	Body VARCHAR(MAX) NOT NULL
)

GO

CREATE TRIGGER tr_EmailNotificationOnNewLog
ON Logs FOR UPDATE
AS
	INSERT INTO NotificationEmails(Recipient, Subject, Body)
		SELECT
			i.AccountId,
			'Balance change for account: ' + i.AccountId,
			'On ' + FORMAT(GETDATE(), 'MMM dd yyyy h:mmtt') + ' your balance was changed from ' + d.OldSum + ' to ' + d.NewSum

		FROM inserted i
		JOIN deleted d ON i.LogId = d.LogId
		WHERE i.NewSum != d.NewSum
GO