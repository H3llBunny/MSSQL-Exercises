SELECT
	mc.CountryCode,
	m.MountainRange,
	p.PeakName,
	p.Elevation
	
FROM MountainsCountries mc
JOIN Countries c ON mc.CountryCode = c.CountryCode
JOIN Mountains m ON mc.MountainId = m.Id
JOIN Peaks p ON m.Id = p.MountainId
WHERE 
	mc.CountryCode = 'BG' AND
	p.Elevation > 2835
ORDER BY p.Elevation DESC
