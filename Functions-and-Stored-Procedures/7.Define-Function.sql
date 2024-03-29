CREATE FUNCTION [dbo].[ufn_IsWordComprised](@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @isComprised BIT = 1;

	DECLARE @i INT = 1;
	WHILE @i <= LEN(@word) AND @isComprised = 1
	BEGIN
		IF CHARINDEX(SUBSTRING(@word, @i, 1), @setOfLetters) = 0
		BEGIN 
			SET @isComprised = 0;
		END
		SET @i = @i + 1;
	END

	RETURN @isComprised;
END