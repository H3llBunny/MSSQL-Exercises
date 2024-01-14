DECLARE @gameId INT, @sum1 MONEY, @sum2 MONEY;

SELECT @gameId = usg.[Id]
FROM UsersGames AS usg
     JOIN Games AS g ON usg.[GameId] = g.[Id]
WHERE g.[Name] = 'Safflower';

SET @sum1 =
(
    SELECT SUM(i.Price)
    FROM Items AS i
    WHERE MinLevel BETWEEN 11 AND 12
);

SET @sum2 =
(
    SELECT SUM(i.Price)
    FROM Items AS i
    WHERE MinLevel BETWEEN 19 AND 21
);

BEGIN TRANSACTION;

IF
(
    SELECT Cash
    FROM UsersGames
    WHERE Id = @gameId
) < @sum1
    BEGIN
        ROLLBACK;
END
    ELSE
    BEGIN
        UPDATE UsersGames
          SET
              Cash = Cash - @sum1
        WHERE Id = @gameId;

        INSERT INTO UserGameItems(UserGameId,
                                  ItemId
                                 )
               SELECT @gameId,
                      Id
               FROM Items
               WHERE MinLevel BETWEEN 11 AND 12;
        COMMIT;
END;

BEGIN TRANSACTION;

IF
(
    SELECT Cash
    FROM UsersGames
    WHERE Id = @gameId
) < @sum2
    BEGIN
        ROLLBACK;
END
    ELSE
    BEGIN
        UPDATE UsersGames
          SET
              Cash = Cash - @sum2
        WHERE Id = @gameId;

        INSERT INTO UserGameItems(UserGameId,
                                  ItemId
                                 )
               SELECT @gameId,
                      Id
               FROM Items
               WHERE MinLevel BETWEEN 19 AND 21;
        COMMIT;
END;

SELECT i.Name AS 'Item Name'
FROM UserGameItems AS ugi
     JOIN Items AS i ON ugi.ItemId = i.Id
WHERE ugi.UserGameId = @gameId;

/* Understood from the exercise but Judge doesn't accept it */
BEGIN TRANSACTION;

-- Add the Items
BEGIN TRY
    INSERT INTO UserGameItems
           SELECT Id,
                  UserGameId
           FROM
           (
               SELECT i.Id,
                      ugi.UserGameId
               FROM Users AS u
                    JOIN UsersGames AS ug ON ug.UserId = u.Id
                    JOIN Games AS g ON g.Id = ug.GameId
                    JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
                    JOIN Items AS i ON i.Id = ugi.ItemId
               WHERE u.FirstName = 'Stamat'
                     AND g.Name = 'Safflower'
                     AND i.Id NOT IN
               (
                   SELECT ugiss.ItemId
                   FROM UserGameItems AS ugiss
                   WHERE ugiss.UserGameId = ugi.UserGameId
               )
           ) AS joined;
END TRY
BEGIN CATCH
    ROLLBACK;
    SELECT ERROR_MESSAGE();
END CATCH;

-- Charging money 
UPDATE ug
  SET
      ug.Cash -= i.Price
FROM Users AS u
     JOIN UsersGames AS ug ON ug.UserId = u.Id
     JOIN Games AS g ON g.Id = ug.GameId
     JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
     JOIN Items AS i ON i.Id = ugi.ItemId
WHERE u.FirstName = 'Stamat'
      AND g.Name = 'Safflower'
      AND i.Id NOT IN
(
    SELECT ugiss.ItemId
    FROM UserGameItems AS ugiss
    WHERE ugiss.UserGameId = ugi.UserGameId
);

-- Check if money are less than zero 
IF(0 >
  (
      SELECT ug.Cash
      FROM Users AS u
           JOIN UsersGames AS ug ON ug.UserId = u.Id
           JOIN Games AS g ON g.Id = ug.GameId
      WHERE u.FirstName = 'Stamat'
            AND g.Name = 'Safflower'
  ))
    BEGIN
        ROLLBACK;
        RAISERROR('Money not enough', 16, 1);
END;

ROLLBACK;

SELECT i.Name AS 'Item Name' 
FROM Items AS i
JOIN UserGameItems AS ugi ON ugi.ItemId = i.Id
JOIN UsersGames AS ug ON ugi.UserGameId = ug.Id
JOIN Games AS g ON ug.GameId = g.Id
WHERE g.Name = 'Safflower'
ORDER BY i.Name