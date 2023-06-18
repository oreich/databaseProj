CREATE OR REPLACE PROCEDURE get_top_players(p_result OUT SYS_REFCURSOR)
IS
BEGIN
    -- Open the cursor for the top players based on average score
    OPEN p_result FOR
        SELECT thrower_ID, AVG(score) AS average_score
        FROM Throw
        GROUP BY thrower_ID
        ORDER BY AVG(score) DESC;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while retrieving the top players.');
END;
/

DECLARE
    l_result SYS_REFCURSOR;
    l_thrower_ID Throw.thrower_ID%TYPE;
    l_average_score Throw.score%TYPE;
BEGIN
    get_top_players(l_result);  -- Retrieve the top players based on average score

    LOOP
        FETCH l_result INTO l_thrower_ID, l_average_score;
        EXIT WHEN l_result%NOTFOUND;

        -- Process each row from the result set
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || l_thrower_ID || ', Average Score: ' || l_average_score);
    END LOOP;

    CLOSE l_result;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while processing the result set.');
END;
/
