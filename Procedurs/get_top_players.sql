CREATE OR REPLACE PROCEDURE get_top_players
IS
BEGIN
    -- Retrieve the top three players based on average score
    FOR player_rec IN (
        SELECT player_id, AVG(throw_score) AS average_score
        FROM throws
        GROUP BY player_id
        ORDER BY AVG(throw_score) DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || player_rec.player_id || ', Average Score: ' || player_rec.average_score);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while retrieving the top players.');
END;
/


BEGIN
    get_top_players;  -- Retrieve the top players based on average score
END;
/
