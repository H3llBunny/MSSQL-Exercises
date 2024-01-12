WITH CurrencyUsageCTE AS (
SELECT
	cou.ContinentCode,
	cou.CurrencyCode,
	COUNT(cou.CountryName) AS CurrencyUsage
FROM Countries cou
JOIN Continents con ON cou.ContinentCode = con.ContinentCode
GROUP BY cou.CurrencyCode, cou.ContinentCode
HAVING COUNT(cou.CountryName) > 1
)
SELECT
	ContinentCode,
    CurrencyCode,
    CurrencyUsage
FROM (
	SELECT
		ContinentCode,
		CurrencyCode,
		CurrencyUsage,
		RANK() OVER (PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC) AS CurrencyRank
	FROM CurrencyUsageCTE
) RankedCurrencies
WHERE CurrencyRank = 1
ORDER BY ContinentCode