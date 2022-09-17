DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_id INT NOT NULL REFERENCES teams
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INT NOT NULL REFERENCES players,
  team_id INT NOT NULL REFERENCES teams
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team1_id INT NOT NULL REFERENCES teams,
  team2_id INT NOT NULL REFERENCES teams
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL, 
  match_id INT NOT NULL REFERENCES matches
);

-- Schema should keep track of the standings/rankings of each team in the league
-- (This doesn’t have to be its own table if the data can be captured somehow)

-- This can be done by counting the number of times a team's id appears inside of the 'goals' table, then ordering it by DESC

-- SELECT team_id, COUNT(team_id) AS total_goals
-- FROM goals
-- GROUP BY team_id
-- ORDER BY total_goals DESC;
