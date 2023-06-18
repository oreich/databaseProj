CREATE VIEW throw_type_view AS
SELECT throw_type, style_throw, time, score, location,thrower_ID
FROM Throw;



CREATE VIEW throw_game_view AS
SELECT game_ID, player_ID, time, score
FROM Throw;

