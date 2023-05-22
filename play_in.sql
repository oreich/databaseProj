CREATE TABLE play_in
(
  salary INT NOT NULL,
  start_year INT NOT NULL,
  game_ID INT NOT NULL,
  player_ID INT NOT NULL,
  PRIMARY KEY (game_ID, player_ID),
  FOREIGN KEY (game_ID) REFERENCES game(game_ID),
  FOREIGN KEY (player_ID) REFERENCES player(player_ID)
);