require 'byebug'
require './position.rb'

class Board

  attr_reader :board, :player1, :player2, :p1_turn

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
    puts "Welcome! It's time to play Tic Tac Toe."
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
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[position[1]]
  end

  def place_on_board
    until full do #BUG: does not go until the board is full
      puts "Choose a spot on the tic tac toe board."
      position = gets.chomp
      x = x_of(position)
      y = y_of(position)
      if x && y && @board[x][y].status == nil
        @board[x][y].status = @p1_turn
        take_turn
        display_board
      elsif x && y && @board[x][y].occupied
        puts "That spot is already taken!"
      else
        # BUG: Cannot enter invalid entry!
        puts "This spot does not exist on the board. Sorry sucka!"
      end
    end
  end

  def take_turn
    @p1_turn = !@p1_turn
  end

  def full
    return true if all? inside all? are occupied (method on position)
  end

  def play
    set_up_game
    display_board
    # until #game is won
    place_on_board
    # end
  end


end
