=begin
*assignment*
Your wizard cousin works at a Quidditch stadium and wants you to write a
function that calculates the points for the Quidditch scoreboard!

Story
Quidditch is a sport with two teams. The teams score goals by throwing the
Quaffle through a hoop, each goal is worth 10 points.

The referee also deducts 30 points (- 30 points) from the team who are guilty of
carrying out any of these fouls: Blatching, Blurting, Bumphing, Haverstacking,
Quaffle-pocking, Stooging.

The match is concluded when the Snitch is caught, and catching the Snitch is
worth 150 points. Let's say a Quaffle goes through the hoop just seconds after
the Snitch is caught, in that case the points of that goal should not end up on
the scoreboard seeing as the match is already concluded.

You don't need any prior knowledge of how Quidditch works in order to complete
this kata, but if you want to read up on what it is, here's a link:
https://en.wikipedia.org/wiki/Quidditch

Task
You will be given a string with two arguments, the first argument will tell you
which teams are playing and the second argument tells you what's happened in the
match. Calculate the points and return a string containing the teams final
scores, with the team names sorted in the same order as in the first argument.

Examples:
Given an input of:
quidditchScoreboard("Ilkley vs Yorkshire", "Ilkley: Quaffle goal, Yorkshire:
Haverstacking foul, Yorkshire: Caught Snitch")

The expected output would be:
"Ilkley: 10, Yorkshire: 120"
Separate the team names from their respective points with a colon and separate
the two teams with a comma.

Good luck!

*problem*
input: two strings: one team names joined with vs; second is team names with
gameplay actions (scoring, fouls, game won) separated by colon from team name
output: string with first team listed : their points, second team listed : their
points

if a quaffle goal is scored or foul is incurred after the snitch is caught, it
is not counted in the final score.

quaffle goal = 10 points
Snitch catch = 150 points
fouls (Blatching, Blurting, Bumphing, Haverstacking,
Quaffle-pocking, Stooging) = -30 points

create a constant to hold the fouls
use a case statement to assign the points
use a hash to track the point accumulations for each team.

*examples / test cases *
see above

*data structures*
array to hold broken up second string values (break on each ', ')
hash of team => points

*algorithm*
BEGIN
  FOULS = %w(Blatching Blurting Bumphing Haverstacking Quaffle-pocking Stooging)
  declare method that accepts two strings (teams, play) as arguments
    team_names = teams.split(' vs ')
    SET tracking_hash = { team_names[0] => 0, team_names[1] => 0 }
    game_progress = play.split(', ')
    counter = 0
    WHILE counter < game_progress.size
      loop through the strings within game_progress accessing string before ':' and after
      string before = team_name; string after = action.
      based on action, add points to the hash.
      case action
      when 'Caught Snitch' then tracking_hash[team_name] += 150
      when 'Quaffle Goal' then tracking_hash[team_name] += 10
      when FOULS.include?(action) then tracking_hash[team_name] -= 30
      end
      break loop IF action == "Caught Snitch"
      counter += 1
    end
    PRINT "#{team_names[0]}: #{tracking_hash[team_names[0]]}, #{team_names[1]}: #{tracking_hash[team_names[1]]}"
END
=end
FOULS = ["Blatching foul", "Blurting foul", "Bumphing foul", "Haverstacking foul", "Quaffle-pocking foul", "Stooging foul"]

def quidditch_scoreboard(teams, play)
  team_name = teams.split(' vs ')
  game_play = play.split(', ')
  scoreboard = { team_name[0] => 0, team_name[1] => 0 }
  game_play.each do |play|
    team, action = play.split(': ')
    if action == 'Caught Snitch'
      scoreboard[team] += 150
    elsif action == 'Quaffle goal'
      scoreboard[team] += 10
    elsif FOULS.include?(action)
      scoreboard[team] += -30
    else
      puts "That's not a valid game play."
    end
    break if action == 'Caught Snitch'
  end

  "#{team_name[0]}: #{scoreboard[team_name[0]]}, #{team_name[1]}: #{scoreboard[team_name[1]]}"
end

p quidditch_scoreboard("Ilkley vs Yorkshire", "Ilkley: Quaffle goal, Yorkshire: Haverstacking foul, Yorkshire: Caught Snitch") == "Ilkley: 10, Yorkshire: 120"
p quidditch_scoreboard("Ilkley vs Yorkshire", "Ilkley: Quaffle goal, Yorkshire: Caught Snitch, Ilkley: Haverstacking foul, Yorkshire: Quaffle goal") == "Ilkley: 10, Yorkshire: 150"
p quidditch_scoreboard("Yorkshire vs Ilkley", "Ilkley: Quaffle-pocking foul, Yorkshire: Quaffle goal, Yorkshire: Blatching foul, Ilkley: Quaffle goal, Yorkshire: Quaffle goal, Ilkley: Haverstacking foul, Ilkley: Caught Snitch") == "Yorkshire: -10, Ilkley: 100"

teams = "Appleby Arrows vs Montrose Magpies"
actions = "Montrose Magpies: Quaffle goal, Montrose Magpies: Quaffle goal, Appleby Arrows: Quaffle goal, Appleby Arrows: Quaffle goal, Montrose Magpies: Haverstacking foul, Appleby Arrows: Quaffle goal, Appleby Arrows: Quaffle goal, Appleby Arrows: Quaffle goal, Appleby Arrows: Quaffle goal, Montrose Magpies: Caught Snitch"
p quidditch_scoreboard(teams, actions) == "Appleby Arrows: 60, Montrose Magpies: 140"


teams = "Kenmare Kestrels vs Barnton"
actions = "Barnton: Quaffle goal, Kenmare Kestrels: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Kenmare Kestrels: Blurting foul, Barnton: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Barnton: Quaffle goal, Kenmare Kestrels: Caught Snitch"
p quidditch_scoreboard(teams, actions) == "Kenmare Kestrels: 130, Barnton: 100"
