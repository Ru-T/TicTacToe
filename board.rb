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

  def full
    board.all? { |row|
      row.all? { |position| position.occupied }
    }
  end

  def winner
    @winning_lines.each do |line|
      if line.all?{|xy| @board[xy[0]][xy[1]].status}
        puts "#{@game.player1.name}, you've won!"
        @win = 1
        break
      elsif line.all?{|xy| @board[xy[0]][xy[1]].status == false}
        puts "#{@game.player2.name}, you've won!"
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
    first_move || random_move #|| winning_move || blocking_move
    puts @position
  end

  def first_move
    if @turn == 1
      if @board[1][1].occupied == false
        @position = "B2"
      elsif @board[1][1].occupied
        @position = "A1"
      end
    end
  end

  # def winning_move
  #   @winning_lines.each do |line|
  #     check_for_win = []
  #     line.each do |position|
  #       if position.any? {|xy| @board[xy[0]][xy[1]].status == false}
  #         check_for_win << position
  #         if check_for_win.length == 2
  #           @position = line - check_for_win
  #         end
  #       end
  #     end
  #   end
  # end
  #
  # def blocking_move
  #   @winning_lines.each do |line|
  #     check_for_win = []
  #     line.each do |position|
  #       if position.any? {|xy| @board[xy[0]][xy[1]].status}
  #         check_for_win << position
  #         if check_for_win.length == 2
  #           return line - check_for_win
  #         end
  #       end
  #     end
  #   end
  # end

  def random_move
    @position = @moves.sample
  end

  def play_game
    display_board
    until full do
      puts "Choose a spot on the tic tac toe board."
      if @game.computer_game && @p1_turn == false
        computer_turn
      else
        @position = gets.chomp
      end
      possible_moves
      x = x_of(@position)
      y = y_of(@position)
      if x && y
        if @board[x][y].occupied == false
          @board[x][y].status = @p1_turn
          take_turn
          display_board
          winner
          break if @win == 1 || @win == -1
          puts "The game is a draw." if full
        elsif @board[x][y].occupied
          puts "That spot is already taken!"
        end
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
  end

end
