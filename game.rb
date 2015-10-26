require 'byebug'
require './computer_player.rb'

class Game

  attr_reader :player1, :player2, :computer_game

  def initialize
    @player1 = player1
    @player2 = player2
    @computer_game = false
  end

  def set_up_game
    puts "Welcome! It's time to play Tic Tac Toe."
    puts "How many human players: one or two?"
    entry = gets.chomp
    puts "Player 1, please enter your name."
    name1 = gets.chomp
    @player1 = name1
    if entry == "two"
      puts "Player 2, please enter your name."
      name2 = gets.chomp
      @player2 = name2
    elsif entry == "one"
      @player2 = ComputerPlayer.new
      @computer_game = true
    else
      puts "Please specify how many players: one or two."
    end
  end

end
