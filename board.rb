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
    @p1_turn = true
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
    array = []
    until array.length == 9 # refactor to until the game is won
    puts "Choose a spot on the tic tac toe board."
      position = gets.chomp
      x = x_of(position)
      y = y_of(position)
      if @board[x][y].status == nil
        @board[x][y].status = true
        # take_turn
        display_board
        array << position
      elsif @board[x][y].occupied
        puts "That spot is already taken!"
      else
        # BUG: Cannot enter invalid entry!
        puts "This spot does not exist on the board. Sorry sucka!"
      end
    end
    puts "The game is a draw - neither player has won."
  end

  def take_turn
    if @p1_turn
      @board[x][y].status = true
      @p1_turn = false
    else
      @board[x][y].status = false
      @p1_turn = true
    end
  end

end
