WITH RankedPeaksAndRivers AS (
SELECT
	c.CountryName,
	MAX(p.Elevation) AS HighestPeakElevation,
	MAX(r.Length) AS LongestRiverLength
FROM 
	Countries c
LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains m ON mc.MountainId = m.Id
LEFT JOIN Peaks p ON m.Id = p.MountainId
LEFT JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers r ON cr.RiverId = r.Id
GROUP BY c.CountryName
)

SELECT TOP 5
	CountryName,
	NULLIF(HighestPeakElevation, 0) AS HighestPeakElevation,
    NULLIF(LongestRiverLength, 0) AS LongestRiverLength
FROM RankedPeaksAndRivers
ORDER BY
	HighestPeakElevation DESC,
    LongestRiverLength DESC,
	CountryName