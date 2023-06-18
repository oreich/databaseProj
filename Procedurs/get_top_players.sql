CREATE OR REPLACE TYPE player_info_type AS OBJECT (
    thrower_ID   INT,
    average_score NUMBER
);

CREATE OR REPLACE TYPE player_info_table AS TABLE OF player_info_type;

CREATE OR REPLACE PROCEDURE get_top_players(p_result OUT player_info_table)
IS
BEGIN
    -- Retrieve the top players based on average score
    SELECT player_info_type(thrower_ID, AVG(score))
    BULK COLLECT INTO p_result
    FROM Throw
    GROUP BY thrower_ID
    ORDER BY AVG(score) DESC;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while retrieving the top players.');
END;
/
DECLARE
    l_result player_info_table;
BEGIN
    get_top_players(l_result);  -- Retrieve the top players based on average score

    FOR i IN 1 .. l_result.COUNT LOOP
        -- Process each player info from the collection
        DBMS_OUTPUT.PUT_LINE('Player ID: ' || l_result(i).thrower_ID || ', Average Score: ' || l_result(i).average_score);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while processing the result set.');
END;
/
