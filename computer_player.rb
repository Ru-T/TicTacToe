require 'byebug'
require './board.rb'

class ComputerPlayer

  attr_reader :board, :name

  def initialize(name, board)
    @name = name
    @board = board
    @turn = 0
  end

  def take_turn
    @turn += 1
  end

  def computer_turn #hard-coded
    first_move || second_move || blocking_move || random_move
  end

  def first_move
    if @turn == 0
      take_turn
      "B2"
    end
  end

  def second_move #hard-coded
    if @turn == 1
      take_turn
      if @board.board[1][0].occupied || @board.board[2][0].occupied
        "A3"
      elsif @board.board[0][1].occupied || @board.board[0][2].occupied
        "C1"
      elsif @board.board[1][2].occupied || @board.board[2][1].occupied || @board.board[2][2].occupied
        "A1"
      else @board.board[0][0].occupied
        "C3"
      end
    end
  end

  def find_blocking_coordinates
    @board.winning_lines.each do |line|
      check_for_block = []
      line.each do |xy|
        if @board.board[xy[0]][xy[1]].status == false
          check_for_block << xy
          if check_for_block.length == 2
            return (line - check_for_block).first
          end
        end
      end
    end
    return nil
  end

  def blocking_move
    block_move = find_blocking_coordinates
    if block_move
      if @board.board[block_move[0]][block_move[1]].occupied == false
        @board.get_position(block_move)
      end
    end
  end

  def random_move
    @board.spots.sample
  end

end
