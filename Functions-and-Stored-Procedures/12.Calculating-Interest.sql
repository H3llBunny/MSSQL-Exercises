CREATE PROCEDURE dbo.usp_CalculateFutureValueForAccount
    @AccountId INT,
    @InterestRate FLOAT(24)
AS
BEGIN
    SELECT
        a.Id,
        ah.FirstName,
        ah.LastName,
        a.Balance AS CurrentBalance,
        dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5) AS FutureValue
    FROM
        Accounts a
    JOIN
        AccountHolders ah ON a.AccountHolderId = ah.Id
    WHERE
        a.Id = @AccountId;
END;