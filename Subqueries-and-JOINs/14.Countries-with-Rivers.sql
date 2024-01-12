SELECT
	cou.CountryName,
	r.RiverName
FROM CountriesRivers cr
RIGHT JOIN Rivers r ON cr.RiverId = r.Id
RIGHT JOIN Countries cou ON cr.CountryCode = cou.CountryCode
RIGHT JOIN Continents con ON cou.ContinentCode = con.ContinentCode
WHERE con.ContinentName = 'Africa'
ORDER BY cou.CountryName