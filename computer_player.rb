require 'byebug'

class ComputerPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    # @position = nil
    # @score = score
    # @scores = []
    # @board = Board.new
  end

  # def computer_turn
  #   middle_score
  #   @position = @scores.min
  #   puts @position
  # end
  #
  # def middle_score
  #   moves = []
  #   @scores = moves.collect{ |scenario| scenario.score }
  #   if @p1_turn #hardcoded that computer is player 2
  #     @scores.max
  #   else
  #     @scores.min
  #   end
  # end
  #
  # def final_score
  #   if @board.win == 1
  #     @score = 1
  #   elsif @board.win == -1
  #     @score = -1
  #   else full
  #     @score = 0
  #   end
  #   @score
  # end
  #
  # def score
  #   @score ||= final_score || middle_score
  # end

end
