require 'byebug'
require './computer_player.rb'
require './human_player.rb'
require './board.rb'

class Game

  attr_reader :player1, :player2, :computer_game

  def initialize
    @board = Board.new
    @computer_game = false
    @p1_turn = true
  end

  def play
    set_up_game
    @board.display_board
    play_game
  end

  def set_up_game
    puts "Welcome! It's time to play Tic Tac Toe."
    puts "How many human players: one or two?"
    entry = gets.chomp
    if entry == "one"
      @player1 = ComputerPlayer.new("Unbeatable", @board) #hard-coded
      @computer_game = true
      puts "Please enter your name."
      name2 = gets.chomp
      @player2 = HumanPlayer.new(name2, @board)
    elsif entry == "two"
      puts "Player 1, please enter your name."
      name1 = gets.chomp
      @player1 = HumanPlayer.new(name1, @board)
      puts "Player 2, please enter your name."
      name2 = gets.chomp
      @player2 = HumanPlayer.new(name2, @board)
    else
      puts "Please specify how many players: one or two."
    end
  end

  def play_game
    until @board.full do
      puts "Choose a move on the tic tac toe board."
      if @computer_game && @p1_turn
        move = @player1.computer_turn # this is hard-coded
      else
        move = gets.chomp
      end
      x = @board.x_of(move)
      y = @board.y_of(move)
      if x && y
        if @board.board[x][y].occupied == false
          @board.board[x][y].status = @p1_turn
          take_turn
          @board.open_spots(move)
          break if winner == true
        elsif @board.board[x][y].occupied
          puts "That spot is already taken!"
        end
      else
        puts "This spot does not exist. Sorry sucka!"
      end
    end
    draw?
  end

  def take_turn
    @p1_turn = !@p1_turn
    @board.display_board
  end

  def winner
    @board.winning_lines.each do |line|
      if line.all?{|xy| @board.board[xy[0]][xy[1]].status}
        puts "#{@player1.name} won!"
        return true
        break
      elsif line.all?{|xy| @board.board[xy[0]][xy[1]].status == false}
        puts "#{@player2.name} won!"
        return true
        break
      else
        return false
        break
      end
    end
  end

  def draw?
    if @board.full && winner == false
      puts "The game is a draw."
    end
  end

end
