CREATE OR REPLACE FUNCTION add_throw(
    p_player_id   IN NUMBER,
    p_game_id     IN NUMBER,
    p_throw_time  IN NUMBER,
    p_throw_score IN NUMBER
) RETURN VARCHAR2
IS
    l_result VARCHAR2(100);
BEGIN
    -- Check if throw time is within the valid range (1-48)
    IF p_throw_time >= 1 AND p_throw_time <= 48 THEN
        -- Check if throw score is within the valid range (0-3)
        IF p_throw_score >= 0 AND p_throw_score <= 3 THEN
            -- Insert the throw into the database
            INSERT INTO throws (player_id, game_id, throw_time, throw_score)
            VALUES (p_player_id, p_game_id, p_throw_time, p_throw_score);

            l_result := 'Throw added successfully.';
        ELSE
            l_result := 'Throw score is invalid. Please enter a score between 0 and 3.';
        END IF;
    ELSE
        l_result := 'Throw time is invalid. Please enter a time between 1 and 48.';
    END IF;

    RETURN l_result;
EXCEPTION
    WHEN OTHERS THEN
        l_result := 'An error occurred while adding the throw.';
        RETURN l_result;
END;
/


DECLARE
    l_result VARCHAR2(100);
BEGIN
    l_result := add_throw(123, 456, 10, 2);  -- Example: Add a throw for player ID 123, game ID 456, at time 10 with a score of 2
    DBMS_OUTPUT.PUT_LINE(l_result);
END;
/
