CREATE OR REPLACE PROCEDURE GetTopPlayers
IS
BEGIN
  FOR rec IN (
    SELECT thrower_ID, SUM(score) AS total_score
    FROM Throw
    GROUP BY thrower_ID
    ORDER BY total_score DESC
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Player ID: ' || rec.thrower_ID || ', Total Score: ' || rec.total_score);
  END LOOP;
END;
/
