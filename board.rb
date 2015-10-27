require 'byebug'
require './position.rb'
require './game.rb'

class Board

  attr_reader :board, :p1_turn, :win, :position, :moves

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
    @position = nil
    @moves = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @turn = 0
    @block_move = nil
    @win_move = nil
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

  def x_of(position)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[position[0]]
  end

  def y_of(position)
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[position[1]]
  end

  def get_position(xy)
    letter_hash = { 0 => "A", 1 => "B", 2 => "C" }
    letter = letter_hash[xy[0][0]]
    number_hash = {0 => "1", 1 => "2", 2 => "3" }
    number = number_hash[xy[0][1]]
    @position = "#{letter}" + "#{number}"
  end

  def full
    board.all? { |row|
      row.all? { |position| position.occupied }
    }
  end

  def winner
    @winning_lines.each do |line|
      if line.all?{|xy| @board[xy[0]][xy[1]].status}
        puts "#{@game.player1.name} won!"
        @win = 1
        break
      elsif line.all?{|xy| @board[xy[0]][xy[1]].status == false}
        puts "#{@game.player2.name} won!"
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
    @moves.delete(@position)
  end

  def computer_turn
    first_move || second_move || blocking_move || winning_move || random_move
    puts @position
  end

  def first_move
    @position = "B2" if @turn == 0
  end

  def second_move
    if @turn == 2
      if @board[1][0].occupied || @board[2][0].occupied
        @position = "A3"
      elsif @board[0][1].occupied || @board[0][2].occupied
        @position = "C1"
      elsif @board[1][2].occupied || @board[2][1].occupied || @board[2][2].occupied
        @position = "A1"
      else @board[0][0].occupied
        @position = "C3"
      end
    end
  end

  def blocking_move
    @winning_lines.each do |line|
      check_for_block = []
      line.each do |xy|
        if @board[xy[0]][xy[1]].status == false
          check_for_block << xy
        end
        if check_for_block.length == 2
          @block_move = line - check_for_block
          break
        end
      end
    end
    @position = get_position(@block_move) if @block_move
    @block_move = nil
  end

  def winning_move
    @winning_lines.each do |line|
      check_for_win = []
      line.each do |xy|
        if @board[xy[0]][xy[1]].status
          check_for_win << xy
        end
        if check_for_win.length == 2
          @win_move = line - check_for_win
          break
        end
      end
    end
    @position = get_position(@win_move) if @win_move
    @win_move = nil
  end

  def random_move
    @position = @moves.sample
  end

  def play_game
    display_board
    until full do
      puts "Choose a spot on the tic tac toe board."
      if @game.computer_game && @p1_turn
        computer_turn
      else
        @position = gets.chomp
      end
      x = x_of(@position)
      y = y_of(@position)
      if x && y
        if @board[x][y].status == nil
          @board[x][y].status = @p1_turn
          take_turn
          display_board
          winner
          possible_moves
          break if @win == 1 || @win == -1
        elsif @board[x][y].occupied
          puts "That spot is already taken!"
        end
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
  end

end
