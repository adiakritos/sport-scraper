### Stanitize Games Algorithm

Assumes only two sources.


#### games table

* games
  * date - relative to server | unchanged
  * sport
  * source
  * home team
  * away team
  * scores
  * league
  * game_id
  * state - santized, dirty, untouched



get games from all sources and save them in games table.



after x time interval, do:

get all untouched games.

group games by date.

for a given day,
  check games with matching leagues.
  if matching leagues exist, find matching teams.
    if matching teams are found
      compare scores
        if scores are the same
          set game_id on both
          set as santized
        else
          set game_id on both
          set as dirty
    else
      set game_id
      set as santized
  else
    set game_id
    set as santized


