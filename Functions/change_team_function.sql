CREATE OR REPLACE FUNCTION change_player_team (
   p_player_id   IN NUMBER,
   p_new_team_id IN NUMBER
) RETURN VARCHAR2
IS
   l_result VARCHAR2(100);
BEGIN
   -- Update the player's team
   UPDATE play_in
   SET chashken.team_id = p_new_team_id
   WHERE liocihen.player.id = p_player_id;

   -- Check if the update was successful
   IF SQL%ROWCOUNT > 0 THEN
      l_result := 'Player team updated successfully.';
   ELSE
      l_result := 'Player team update failed. Player ID or team ID not found.';
   END IF;

   RETURN l_result;
EXCEPTION
   WHEN OTHERS THEN
      l_result := 'An error occurred while updating the player team.';
      RETURN l_result;
END;
/


DECLARE
   l_result VARCHAR2(100);
BEGIN
   l_result := change_player_team(123, 456);  -- Example: Change player ID 123 to team ID 456
   DBMS_OUTPUT.PUT_LINE(l_result);
END;
/
