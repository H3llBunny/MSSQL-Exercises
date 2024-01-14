/* Trigget for validating user's level when buying items */
CREATE TRIGGER tr_PreventHigherItemLevelPurchase
ON UserGameItems
INSTEAD OF UPDATE
AS
	BEGIN
		IF(
			(
				SELECT Level
				FROM UsersGames
				WHERE Id =
				(
					SELECT UserGameId
					FROM inserted
				)
			) <
				(
					SELECT MinLevel
					FROM Items
					WHERE Id = 
				(
					SELECT ItemId
					FROM inserted
				)
			  )
			)
				BEGIN
					RAISERROR('Your current level is not enough', 16, 1);
				END;

/* Assign the new item when the exception isn't thrown */

				INSERT INTO UserGameItems
				VALUES
				(
				(
					SELECT ItemId
					FROM inserted
				),
				(
					SELECT UserGameId
					FROM inserted
				)
				);
			END;

/* Add bonus cash */

UPDATE ug
	SET ug.Cash += 50000
FROM UsersGames ug
JOIN Users u ON ug.UserId = u.Id
JOIN Games g ON ug.GameId = g.Id
WHERE 
	u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos') AND
	g.Name = 'Bali';