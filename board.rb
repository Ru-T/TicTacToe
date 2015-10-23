require 'byebug'

class Board

  attr_reader :board, :player1, :player2

  def initialize
    @board = Array.new(9)
    @player1 = player1
    @player2 = player2
  end

  def display_board
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
  end

  def set_up_game
    puts "Player 1, please enter your name."
    name1 = gets.chomp
    @player1 = name1
    puts "Player 2, please enter your name."
    name2 = gets.chomp
    @player2 = name2
  end

end
