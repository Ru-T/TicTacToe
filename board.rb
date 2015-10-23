require 'byebug'
require './position.rb'

class Board

  attr_reader :board, :player1, :player2

  def initialize
    @board = [[Position.new, Position.new, Position.new]],
             [[Position.new, Position.new, Position.new]],
             [[Position.new, Position.new, Position.new]]
    @player1 = player1
    @player2 = player2
  end

  def display_board
    puts @board
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
