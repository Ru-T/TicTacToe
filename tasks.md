##BUGS
[  ] Bug in winning method - not acknowledging some wins
[  ] Bug in unbeatable - seemingly moving to random when should be blocking
[  ] Bug in returning error when first entry is not "one" or "two"

## TASK LIST

[ X ] Create empty tic tac toe board
[ X ] User should be asked for a location (A1, A2 etc.)
[ X ] When user enters location, X is marked not he board.
[ X ] If user enters invalid entry, reprimanded and try again.
[ X ] User inputs valid locations until the board is full, then the game is over.
[ X ] Create concept of position and tell user if location is already occupied.
[ X ] Allow two human players to play.
[ X ] The first marks the board with “X”, the second marks the board with “O”.
[ X ] Any invalids of duplicates should alert the player but stay on their turn until they enter a valid location.
[ X ] Allow a player to win.
[ X ] If a player wins, end the game and report who won.
[ X ] Create the concept of a computer player.
[ X ] If the computer is playing, choose a random position. (dumb computer)
[ X ] Either computer or human can win.

## UNBEATABLE

[ X ] Create concept of possible remaining moves.
[ X ] Create concept of score when win, lose, draw.

## REFACTOR

[ X ] Refactor computer logic into computer player class
[ X ] Refactor game logic into game class
[   ] Refactor such that either human or computer can go first.
[   ] Refactor such that board can be set to any grid size.

## MINIMAX (LATER)

[   ] Create decision tree from each remaining move.
[   ] Computer chooses move with min score (same index.)
[   ] Add the concept of depth so player isn't fatalist
[   ] Optimize - stop minimax when a move returns first loss.
