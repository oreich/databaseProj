CREATE OR REPLACE FUNCTION change_player_team(
    p_play_in_id  IN play_in.play_in_id%TYPE,
    p_team_id     IN play_in.team_id%TYPE
) RETURN VARCHAR2
IS
    l_result VARCHAR2(100);
BEGIN
    -- Update the team of the player in the play_in table
    UPDATE play_in
    SET team_id = p_team_id
    WHERE play_in_id = p_play_in_id;

    l_result := 'Player team changed successfully.';
    RETURN l_result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        l_result := 'Play_in ID not found.';
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
    123, -- Play_in ID
    456 -- New team ID
  );
  DBMS_OUTPUT.PUT_LINE(result);
END;
/
