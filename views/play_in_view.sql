CREATE OR REPLACE VIEW play_in_view AS
SELECT p.player_ID, p.player_name, g.game_ID, g.game_date, pl.salary, pl.start_year
FROM play_in pl
JOIN player p ON p.player_ID = pl.player_ID
JOIN game g ON g.game_ID = pl.game_ID;
