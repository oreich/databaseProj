CREATE OR REPLACE PROCEDURE calculate_average_score(
    p_player_id   IN NUMBER
)
IS
    l_total_score NUMBER := 0;
    l_throw_count NUMBER := 0;
    l_average_score NUMBER;
BEGIN
    -- Calculate the total score and throw count for the player
    SELECT SUM(throw_score), COUNT(*)
    INTO l_total_score, l_throw_count
    FROM throws
    WHERE player_id = p_player_id;

    -- Calculate the average score
    IF l_throw_count > 0 THEN
        l_average_score := l_total_score / l_throw_count;
        DBMS_OUTPUT.PUT_LINE('Average score for Player ID ' || p_player_id || ' is ' || l_average_score);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No throws found for Player ID ' || p_player_id);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No throws found for Player ID ' || p_player_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while calculating the average score.');
END;
/

BEGIN
    calculate_average_score(123);  -- Example: Calculate the average score for Player ID 123
END;
/
