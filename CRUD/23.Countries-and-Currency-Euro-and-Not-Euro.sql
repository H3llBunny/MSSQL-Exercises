SELECT
	CountryName,
	CountryCode,
	CASE
		WHEN CurrencyCode != 'EUR' THEN 'Not Euro'
		ELSE 'Euro'
		END
FROM Countries
ORDER BY CountryName