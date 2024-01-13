CREATE FUNCTION dbo.ufn_CashInUsersGames(@GameName VARCHAR(100))
RETURNS TABLE
AS
RETURN
	SELECT
		SUM(Cash) AS SumCash
	FROM
	(
		SELECT
			ug.Cash,
			ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS RowNum
		FROM UsersGames ug
		JOIN Games g ON ug.GameId = g.Id
		WHERE g.Name = @GameName
		) AS RankedGames
	WHERE RowNum % 2 != 0