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
    @winning_lines = [
              # horizontally:
              [[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]],
              # vertically:
              [[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]],
              # # diagonally:
              [[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]
              ]
    @win = false
  end

  private def display_board
    puts "#{@board[0][0]}" + "|" + "#{@board[0][1]}" + "|" + "#{@board[0][2]}"
    puts "#{@board[1][0]}" + "|" + "#{@board[1][1]}" + "|" + "#{@board[1][2]}"
    puts "#{@board[2][0]}" + "|" + "#{@board[2][1]}" + "|" + "#{@board[2][2]}"
  end

  private def set_up_game
    puts "Welcome! It's time to play Tic Tac Toe."
    puts "Player 1, please enter your name."
    name1 = gets.chomp
    @player1 = name1
    puts "Player 2, please enter your name."
    name2 = gets.chomp
    @player2 = name2
  end

  private def x_of(position)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[position[0]]
  end

  private def y_of(position)
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[position[1]]
  end

  private def take_turn
    @p1_turn = !@p1_turn
    display_board
  end

  def full # You can get this on one line
    board.all? do |row|
      row.all? do |position|
        position.occupied
      end
    end
  end

  private def winner
    @winning_lines.each do |line|
      if line.all?{|xy| @board[xy[0]][xy[1]].status}
        puts "#{@player1}, you've won!"
        @win = true
        break
      elsif line.all?{|xy| @board[xy[0]][xy[1]].status == false}
        puts "#{@player2}, you've won!"
        @win = true
        break
      else
        @win = false
      end
    end
  end

  private def place_on_board
    display_board
    until full do
      puts "Choose a spot on the tic tac toe board."
      position = gets.chomp
      x = x_of(position)
      y = y_of(position)
      if x && y && @board[x][y].status == nil
        @board[x][y].status = @p1_turn
        take_turn
        winner
        break if @win == true
      elsif x && y && @board[x][y].occupied
        puts "That spot is already taken!"
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
  end

  def play
    set_up_game
    place_on_board
  end

end
