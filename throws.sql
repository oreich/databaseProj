CREATE TABLE Throw
(
  type VARCHAR(20) NOT NULL,
  style VARCHAR(20) NOT NULL,
  time INT NOT NULL,
  score INT NOT NULL,
  location VARCHAR(20) NOT NULL,
  thrower_ID INT NOT NULL,
  game_ID INT NOT NULL,
  PRIMARY KEY (time, game_ID)
);