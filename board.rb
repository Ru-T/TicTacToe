require 'byebug'
require './position.rb'

class Board

  attr_reader :board, :player1, :player2

  def initialize
    @board = [[Position.new("A1"), Position.new("A2"), Position.new("A3")],
             [Position.new("B1"), Position.new("B2"), Position.new("B3")],
             [Position.new("C1"), Position.new("C2"), Position.new("C3")]]
    @player1 = player1
    @player2 = player2
    @p1_turn = true
  end

  def display_board
    puts @board[0][0].status + "|" + @board[0][1].status + "|" + @board[0][2].status
    puts @board[1][0].status + "|" + @board[1][1].status + "|" + @board[1][2].status
    puts @board[2][0].status + "|" + @board[2][1].status + "|" + @board[2][2].status
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
