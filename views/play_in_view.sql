CREATE OR REPLACE VIEW play_in_view AS
SELECT pi.salary, pi.start_year, p.player_ID, p.player_name
FROM play_in pi
JOIN player p ON p.player_ID = pi.player_ID;
