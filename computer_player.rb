require 'byebug'
require './board.rb'

class ComputerPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    @board = Board.new
    @block_move = nil
  end

  def computer_turn #hard-coded
    first_move || second_move || blocking_move || random_move
    puts @board.move
  end

  def first_move
    @board.move = "B2" if @board.turn == 0 #hard-coded
  end

  def second_move #hard-coded
    if @board.turn == 2
      if @board[1][0].occupied || @board[2][0].occupied
        @board.move = "A3"
      elsif @board[0][1].occupied || @board[0][2].occupied
        @board.move = "C1"
      elsif @board[1][2].occupied || @board[2][1].occupied || @board[2][2].occupied
        @board.move = "A1"
      else @board[0][0].occupied
        @board.move = "C3"
      end
    end
  end

  def blocking_move
    @board.winning_lines.each do |line|
      check_for_block = []
      line.each do |xy|
        if @board[xy[0]][xy[1]].status == false
          check_for_block << xy
        end
        if check_for_block.length == 2
          @block_move = line - check_for_block
          break
        end
      end
    end
    if @board[@block_move[0][0]][@block_move[0][1]].occupied == false
      @board.move = get_coordinates(@block_move)
    end
  end

  def random_move
    @board.move = @board.moves.sample
  end

end
