SELECT
	PeakName,
	RiverName,
	LOWER(PeakName) + LOWER(RiverName) AS Mix
FROM	
	Peaks,
	Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix