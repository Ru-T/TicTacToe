# TicTacToe

This is a TicTacToe game built in Ruby.

## Execute

To execute this program, run play.rb from the command line.

## How to Play

1. Choose number of human players.
- If you choose two players, you can input a name for each player and begin.
- If you choose one player, a computer player will become your opponent.

2. Two players, X and O, take turns marking the spaces in a grid, 3x3 in this case.

3. The player who places three of their moves in a horizontal, vertical, or diagonal row wins the game.

4. If the board is full without a winner, the game ends in a draw.

## Unbeatable

The computer player is unbeatable. How does s/he do this?

1. The computer player always goes first and plays the center.
2. On its second move, it plays optimally according to the other player's move.
3. The computer will then play a blocking move wherever necessary.
4. If there are no blocks, it will play randomly from the remaining moves until the game ends in a draw.

## Next Steps

- Refactor such that either human or computer can go first.
- Refactor such that board can be set to any grid size.
- Refactor to use MiniMax algorithm 
