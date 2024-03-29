CREATE FUNCTION [dbo].[ufn_CalculateFutureValue](@sum DECIMAL(20,4), @yearlyInterestRate FLOAT(24), @numberOfYears INT)
RETURNS DECIMAL(20, 4)
AS
BEGIN
	DECLARE @result DECIMAL(20, 4);
	SET @result = @sum * POWER((1 + @yearlyInterestRate), @numberOfYears);
	RETURN ROUND(@result, 4);
END;
