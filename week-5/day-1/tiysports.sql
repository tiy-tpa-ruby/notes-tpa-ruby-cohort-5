
CREATE TABLE players(id serial primary key, name char(100), address char(100), shirt_size char(100), age integer, birthday date);
CREATE TABLE teams(id serial primary key, name char(100), mascot char(100), sport char(100), sponsor_id integer);
CREATE TABLE memberships(team_id integer, player_id integer);
CREATE TABLE sponsors(id serial primary key, address char(100), phone char(100), email char(100), name char(100));
