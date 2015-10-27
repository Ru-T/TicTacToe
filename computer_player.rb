require 'byebug'
require './board.rb'

class ComputerPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    @board = Board.new
  end

end  

  # def first_move
  #   if @board.turn == 0
  #     @board.position = "B2"
  #   end
  # end
  #
  # def second_move
  #   if @board.turn == 2
  #     if @board[1][0].occupied || @board[2][0].occupied
  #       @board.position = "A3"
  #     elsif @board[0][1].occupied || @board[0][2].occupied
  #       @board.position = "C1"
  #     elsif @board[1][2].occupied || @board[2][1].occupied || @board[2][2].occupied
  #       @board.position = "A1"
  #     else @board[0][0].occupied
  #       @board.position = "C3"
  #     end
  #   end
  # end
  #
  # # def blocking_move
  # #   @winning_lines.each do |line|
  # #     check_for_block = []
  # #     line.each do |position|
  # #       if position.any? {|xy| @board[xy[0]][xy[1]].status == false}
  # #         check_for_block << position
  # #         if check_for_block.length == 2
  # #           @block_move = line - check_for_block
  # #           byebug
  # #           break
  # #         end
  # #       end
  # #     end
  # #   end
  # # end
  #
  # def random_move
  #   @board.position = @board.moves.sample
  # end



#
# def computer_turn
#   minimax
#   puts @position
# end
#
# def minimax
#   scores = {}
#   @moves.each do |move|
#     x = x_of(move)
#     y = y_of(move)
#     @board[x][y].status = @p1_turn
#     if final_state?
#       final_score
#       scores[move] = @score
#     end
#     take_turn
#     minimax
#   end
#   scores.key(min)
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
