SELECT
	mc.CountryCode,
	COUNT(m.MountainRange) AS MountainRanges
FROM MountainsCountries mc
JOIN Countries c ON mc.CountryCode = c.CountryCode
JOIN Mountains m ON mc.MountainId = m.Id
WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria')
GROUP BY mc.CountryCode
