require 'byebug'
require './position.rb'

class Board

  attr_reader :board, :player1, :player2

  def initialize
    @board = [[Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new]]
    @player1 = player1
    @player2 = player2
  end

  def display_board
    puts "#{@board[0][0]}" + "|" + "#{@board[0][1]}" + "|" + "#{@board[0][2]}"
    puts "#{@board[1][0]}" + "|" + "#{@board[1][1]}" + "|" + "#{@board[1][2]}"
    puts "#{@board[2][0]}" + "|" + "#{@board[2][1]}" + "|" + "#{@board[2][2]}"
  end

  def set_up_game
    puts "Player 1, please enter your name."
    name1 = gets.chomp
    @player1 = name1
    puts "Player 2, please enter your name."
    name2 = gets.chomp
    @player2 = name2
  end

  def x_of(position)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[position[0]]
  end

  def y_of(position)
    position[1].to_i - 1
  end

  def place_on_board
    board = Board.new
    puts "Choose a spot on the tic tac toe board."
    position = gets.chomp
    x = board.x_of(position)
    y = board.y_of(position)
    @board[x][y].status = true
    display_board
  end

end
