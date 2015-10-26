require 'byebug'

class ComputerPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    # @board = Board.new
  end

end

# def possible_moves
#   @moves.delete(@position)
# end

  # @turn = 0
  # @turn += 1

  # def computer_turn
#   first_move || random_move # || winning_move || blocking_move
#   puts @position
# end
#
# def first_move
#   if @turn == 1
#     if @board[1][1].occupied == false
#       @position = "B2"
#     elsif @board[1][1].occupied
#       @position = "A1"
#     end
#   end
# end

# def winning_move
#   @winning_lines.each do |line|
#     check_for_win = []
#     line.each do |position|
#       if position.any? {|xy| @board[xy[0]][xy[1]].status == false}
#         check_for_win << position
#         return line - check_for_win if check_for_win.length == 2
#       end
#     end
#   end
# end

# def random_move
#   @position = @moves.sample
# end
