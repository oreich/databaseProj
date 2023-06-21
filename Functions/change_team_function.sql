CREATE OR REPLACE FUNCTION change_player_team(
    p_player_id   IN play_in.player_id%TYPE,
    p_game_id     IN play_in.game_id%TYPE,
    p_new_team    IN VARCHAR2
) RETURN VARCHAR2
IS
    l_result VARCHAR2(100);
BEGIN
    -- Update the team of the player in the play_in table
    UPDATE play_in
    SET team = p_new_team
    WHERE player_id = p_player_id AND game_id = p_game_id;

    l_result := 'Player team changed successfully.';
    RETURN l_result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        l_result := 'Player or game not found.';
        RETURN l_result;
    WHEN OTHERS THEN
        l_result := 'An error occurred while changing the player team.';
        RETURN l_result;
END;
/
DECLARE
  result VARCHAR2(100);
BEGIN
  result := change_player_team(
    1, -- Player ID
    123, -- Game ID
    'New Team Name' -- New team value
  );
  DBMS_OUTPUT.PUT_LINE(result);
END;
/
