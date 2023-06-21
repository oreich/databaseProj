CREATE TABLE play_in
(
  play_in_id NOT NULL,
  salary INT NOT NULL,
  start_year INT NOT NULL,
  game_ID INT NOT NULL,
  player_ID INT NOT NULL,
  PRIMARY KEY (play_in_id),
  FOREIGN KEY (game_ID) REFERENCES game(game_ID),
  FOREIGN KEY (player_ID) REFERENCES player(player_ID)
);
