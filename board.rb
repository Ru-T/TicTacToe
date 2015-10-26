require 'byebug'
require './position.rb'
require './game.rb'
#require './computer_player.rb'

class Board

  attr_reader :board, :player1, :player2, :p1_turn, :score

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
    @moves = []
    @score = score
  end

  private def display_board
    @board.each do |row|
      row.each do |position|
        print "#{position}" + "|"
      end
      puts ""
    end
  end

  private def x_of(position)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[position[0]]
  end

  private def y_of(position)
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[position[1]]
  end

  private def full
    board.all? { |row|
      row.all? { |position| position.occupied }
    }
  end

  private def winner
    @winning_lines.each do |line|
      if line.all?{|xy| @board[xy[0]][xy[1]].status}
        puts "#{@game.player1}, you've won!"
        @win = 1
        break
      elsif line.all?{|xy| @board[xy[0]][xy[1]].status == false}
        puts "#{@game.player2}, you've won!"
        @win = -1
        break
      else
        @win = 0
      end
    end
  end

  private def take_turn
    @p1_turn = !@p1_turn
    display_board
  end

  private def computer_turn
    #MISSING BIG MOVE HERE
    puts @position
  end

  def score
    @score ||= final_score || middle_score
  end

  def middle_score
    scores = @moves.collect{ |scenario| scenario.score }
    if @p1_turn == false #hardcoded that computer is player 2
      scores.max
    else
      scores.min
    end
  end

  private def final_score
    if @win == 1
      score = 1
    elsif @win == -1
      score = -1
    else full
      score = 0
    end
    score
  end

  private def play_game
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
      if x && y && @board[x][y].status == nil
        @board[x][y].status = @p1_turn
        take_turn
        winner
        break if @win == 1 || @win == -1
      elsif x && y && @board[x][y].occupied
        puts "That spot is already taken!"
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
  end

  def play
    @game.set_up_game
    play_game
  end

end
