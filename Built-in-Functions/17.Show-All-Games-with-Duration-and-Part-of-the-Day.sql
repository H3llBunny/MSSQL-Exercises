SELECT
	Name AS Game,
	CASE
		WHEN CAST(Start AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN CAST(Start AS TIME) BETWEEN '12:00:01' AND '18:00:00' THEN 'Afternoon'
        WHEN CAST(Start AS TIME) BETWEEN '18:00:01' AND '23:59:59' THEN 'Evening'
		END 
		AS [Part of the Day],
	CASE
		WHEN Duration BETWEEN 0 AND 3 THEN 'Extra Short'
		WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
		WHEN Duration > 6 THEN 'Long'
		WHEN Duration IS NULL THEN 'Extra Long'
		END
		AS Duration
FROM Games
ORDER BY
	Game,
	Duration,
	[Part of the Day]