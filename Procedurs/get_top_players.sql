CREATE OR REPLACE PROCEDURE get_top_players
IS
BEGIN
    -- Retrieve the top three players based on average score
    FOR player_rec IN (
        SELECT thrower_ID, AVG(score) AS average_score
        FROM Throw
        GROUP BY thrower_ID
        ORDER BY AVG(score) DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || player_rec.thrower_ID || ', Average Score: ' || player_rec.average_score);
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
