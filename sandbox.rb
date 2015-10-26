# ISSUES:

# recursive method - is this doing what I think it's doing?
# middle_score method: how do I define scenario? What about when @moves is empty?
# alternate solution below: does this have legs?
# TESTS!!!!
# Refactor in multiple classes
# winner method: do I need @win to pass back who won? do I need both @win and @score??
# play_game method: can this be improved?

# A different approach:
# The computer should assess the board and move accordingly.
# 1) Take the center if it's not yet taken
# OR
# 2) Go for win (row, column, diagonal)
# OR
# 3) Preemptive block (row, column, diaganol)
# OR
# 4) Random move

#Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
# Empty corner: The player plays in a corner square.
# Empty side: The player plays in a middle square on any of the 4 sides.

# Take each remaining position on the board, find coordinates, and put an O there
# Then mark the next possible space with an X
# Then mark the next possible space with an O
# Continue through this loop until you hit a final_state? and give it a score
# If X won, give it a score of 1, if O won, give it a score of -1, if draw, score of 0
# When through with all permutations, select the move with the lowest value and play it

  # @moves = []
  # @score = score
  # @scores = []
  #
  # def middle_score
  #   moves = []
  #   @scores = moves.collect{ |scenario| scenario.score } #DEFINE SCENARIO!
  #   if @p1_turn #hardcoded that computer is player 2
  #     @scores.max
  #   else
  #     @scores.min
  #   end
  # end
  #
  # def computer_turn
  #   middle_score
  #   @position = @scores.min
  #   puts @position
  # end

  # def score
  #   @score ||= final_score || middle_score
  # end
