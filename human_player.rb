require 'byebug'

class HumanPlayer

  attr_reader :name

  def initialize(name, board)
    @name = name
    @board = board
  end

end
