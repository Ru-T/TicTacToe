require 'byebug'

class ComputerPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    # @board = Board.new
  end

end
#
# def computer_turn
#   @position = minimax #should be @next_move
#   puts @position
# end
#
# def minimax
#   scores = {}
#   @moves.each do |move|
#     x = x_of(move)
#     y = y_of(move)
#     @board[x][y].status = @p1_turn
#     take_turn
#     if final_state?
#       final_score
#       scores[move] = @score
#     end
#     if @p1_turn
#       max
#     else
#       min = scores.values.min
#     end
#     scores.key(min)
#   end
#   minimax
# end
#
# def final_score
#   if @win == 1
#     @score = 1
#   elsif @win == -1
#     @score = -1
#   else full
#     @score = 0
#   end
#   @score
# end
#
# def final_state?
#   @win == 1 || @win == -1 || full
# end
