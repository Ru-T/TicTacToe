# ISSUES:

# recursive method - is this doing what I think it's doing?
# middle_score method: how do I define scenario? What about when @moves is empty?
# alternate solution: does this have legs?
# TESTS!!!!
# Refactor in multiple classes
# winner method: do I need @win to pass back who won? do I need both @win and @score??
# play_game method: can this be improved?
# ComputerPlayer doesn't have a name

# A different approach:
# The computer should assess the board and move accordingly.
# 1) Take the center if it's not yet taken
# OR
# 2) Go for win (row, column, diagonal)
# OR
# 3) Preemptive block (row, column, diaganol)
# OR
# 4) Random move

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
