# ISSUES:

# middle_score method: how do I define scenario? What about when @moves is empty?
# recursive method - is this doing what I think it's doing?
# alternate solution: does this have legs?
# TESTS!!!!
# Refactor in multiple classes
# winner method: do I need @win to pass back who won? do I need both @win and @score??
# play_game method: can this be improved?
# ComputerPlayer doesn't have a name


  # def score_possible_moves # call this when computer_turn
  #   @moves = ["A1", "A2", "A3"] #etc.
  #   @moves = remaining_moves
  #   remaining_moves.each do |move|
  #     x = x_of(move)
  #     y = y_of(move)
  #     @board[x][y].status = @p1_turn
  #     if final_state?
  #       final_score
  #     end
  #     break if @scores.include(-1)
  #     @p1_turn = !@p1_turn
  #     remaining_moves - [move]
  #   end
  #   @board[x][y].status = nil #wrong place but reset space so it's not actually marked
  # end
  #
  # def final_state?
  #   @win == 1 || @win == -1 || full
  # end
  #
  # def final_score
  #   if @win == 1
  #     score = 1
  #   elsif @win == -1
  #     score = -1
  #   else full
  #     score = 0
  #   end
  #   @scores << score
  # end

  # @moves = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

  #  def computer_turn
  #   @position = @moves.sample
  #   puts @position
  # end
  #
  # def possible_moves
  #   @moves -= [@position]
  # end
