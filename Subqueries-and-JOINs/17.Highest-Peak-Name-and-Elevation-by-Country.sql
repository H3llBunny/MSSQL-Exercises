WITH CountryPeaks AS (
SELECT
	c.CountryName,
	p.PeakName,
	p.Elevation,
	m.MountainRange,
	ROW_NUMBER() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC, m.MountainRange) AS PeakRank
FROM Countries c
LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains m ON mc.MountainId = m.Id
LEFT JOIN Peaks p ON mc.MountainId = p.MountainId
)
SELECT TOP 5
	CountryName,
	CASE
		WHEN PeakName IS NULL THEN '(no highest peak)'
		ELSE PeakName
	END AS [Highest Peak Name],
	CASE
		WHEN Elevation IS NULL THEN 0
		ELSE Elevation
	END AS [Highest Peak Elevation],
	CASE
		WHEN MountainRange IS NULL THEN '(no mountain)'
		ELSE MountainRange
	END AS Mountain
FROM CountryPeaks
WHERE PeakRank = 1
ORDER BY
	CountryName,
	PeakName