select players.name, teams.mascot
from players, teams, memberships
where players.id = memberships.player_id and teams.id = memberships.team_id;

-- Roster query
select players.name, teams.mascot
from players, teams, memberships
where players.id = memberships.player_id and
      teams.id = memberships.team_id;
