require 'byebug'
require './position.rb'
require './game.rb'

class Board

  attr_accessor :move
  attr_reader :board, :p1_turn, :win, :moves, :turn

  def initialize
    @game = Game.new
    @board = [[Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new]]
    @p1_turn = true
    @winning_lines = [
              [[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]],
              [[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]],
              [[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]
              ]
    @win = nil
    @move = nil
    @moves = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @turn = 0
  end

  def play
    @game.set_up_game
    play_game
  end

private

  def display_board
    @board.each do |row|
      row.each do |position|
        print "#{position}" + "|"
      end
      puts ""
    end
  end

  def x_of(letter)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[letter[0]]
  end

  def y_of(number)
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[number[1]]
  end

  def get_coordinates(xy)
    letter_hash = { 0 => "A", 1 => "B", 2 => "C" }
    letter = letter_hash[xy[0][0]]
    number_hash = {0 => "1", 1 => "2", 2 => "3" }
    number = number_hash[xy[0][1]]
    @move = "#{letter}" + "#{number}"
  end

  def full
    board.all? { |row|
      row.all? { |position| position.occupied }
    }
  end

  def winner
    @winning_lines.each do |line|
      if line.all?{|xy| @board[xy[0]][xy[1]].status}
        puts "#{@game.player1.name} won!" #hard-coded
        @win = 1
        break
      elsif line.all?{|xy| @board[xy[0]][xy[1]].status == false}
        puts "#{@game.player2.name} won!" #hard-coded
        @win = -1
        break
      else
        @win = 0
      end
    end
  end

  def take_turn
    @p1_turn = !@p1_turn
    @turn += 1
  end

  def possible_moves
    @moves.delete(@move)
  end

  def play_game
    display_board
    until full do
      puts "Choose a move on the tic tac toe board."
      if @game.computer_game && @p1_turn
        @game.player1.computer_turn # this is hard-coded
      else
        @move = gets.chomp
      end
      x = x_of(@move)
      y = y_of(@move)
      if x && y
        if @board[x][y].occupied == false
          @board[x][y].status = @p1_turn
          take_turn
          display_board
          possible_moves
          winner
          break if @win == 1 || @win == -1
        elsif @board[x][y].occupied
          puts "That spot is already taken!"
        end
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
    if full && @win == 0
      puts "The game is a draw."
    end
  end

end
