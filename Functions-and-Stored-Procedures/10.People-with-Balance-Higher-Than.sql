CREATE PROC dbo.usp_GetHoldersWithBalanceHigherThan(@Balance DECIMAL(10,2))
AS
	SELECT
		ah.FirstName,
		ah.LastName,
		SUM(a.Balance) AS SumBalance
	FROM AccountHolders ah
	JOIN Accounts a ON ah.Id = a.AccountHolderId
	GROUP BY ah.Id, ah.FirstName, ah.LastName
	HAVING SUM(a.Balance) > @Balance