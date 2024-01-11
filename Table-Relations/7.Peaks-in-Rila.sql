SELECT
	MountainRange,
	PeakName,
	Elevation
FROM Mountains m
JOIN Peaks p ON m.Id = p.MountainId
WHERE MountainRange = 'Rila'
ORDER BY Elevation DESC

