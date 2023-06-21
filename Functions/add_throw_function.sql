CREATE OR REPLACE FUNCTION add_throw(
    throw_id   IN NUMBER,
    throw_type IN VARCHAR2(30),
    location IN VARCHAR2(30),
    time  IN NUMBER,
    thrower_id   IN NUMBER,
    score IN NUMBER,
    game_id     IN NUMBER,
    style_throw IN VARCHAR2(30)
    
) RETURN VARCHAR2

AS
    l_result VARCHAR2(100);
BEGIN
    -- Check if throw time is within the valid range (1-48)
    IF time >= 1 AND time <= 48 THEN
        -- Check if throw score is within the valid range (0-3)
        IF score >= 0 AND score <= 3 THEN
            -- Insert the throw into the database
            INSERT INTO throw (throw_ID,throw_type,location,time,thrower_ID, score,game_ID, style_throw)
            VALUES (throw_id,throw_type,location,time,thrower_id, score,game_id, style_throw);


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


