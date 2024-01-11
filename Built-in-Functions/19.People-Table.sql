CREATE TABLE People (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Birthdate DATE
);

INSERT INTO People (Name, Birthdate)
VALUES
    ('Victor', '2000-12-07'),
    ('Steven', '1992-09-10'),
    ('Stephen', '1910-09-19'),
    ('John', '2010-01-06');

SELECT
    Id,
    Name,
    Birthdate,
    DATEDIFF(YEAR, Birthdate, GETDATE()) AS AgeYears,
    DATEDIFF(MONTH, Birthdate, GETDATE()) AS AgeMonths,
    DATEDIFF(DAY, Birthdate, GETDATE()) AS AgeDays,
    DATEDIFF(MINUTE, Birthdate, GETDATE()) AS AgeMinutes
FROM
    People;