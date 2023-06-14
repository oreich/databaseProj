CREATE TABLE Throw
(
  throw_type VARCHAR(30) NOT NULL,
  style_throw VARCHAR(30) NOT NULL,
  time INT NOT NULL,
  score INT NOT NULL,
  location VARCHAR(30) NOT NULL,
  thrower_ID INT NOT NULL,
  game_ID INT NOT NULL,
  throw_ID INT NOT NULL,
  PRIMARY KEY (thrower_ID)
);
