require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './board.rb'
require './game.rb'

class ComputerPlayerTest < Minitest::Test

  def setup
    @game = Game.new
    @board = Board.new
    @player1 = ComputerPlayer.new("Unbeatable", @board)
  end

  def test_take_turn
    @turn == 0
    @player1.take_turn
    assert_equal 1, @turn
  end

  def test_computer_first_move
    @turn == 0
    assert_equal "B2", @player1.computer_turn
  end

  def test_computer_second_move
    @turn == 1
    @board.board[1][0].occupied
    assert_equal "A3", @player1.computer_turn

    @turn == 1
    @board.board[0][1].occupied
    assert_equal "C1", @player1.computer_turn

    @turn == 1
    @board.board[1][2].occupied
    assert_equal "A1", @player1.computer_turn

    @turn == 1
    @board.board[0][0].occupied
    assert_equal "C3", @player1.computer_turn
  end

  def test_computer_blocking_move
    @board.board[0][0].status = false
    @board.board[0][2].status = false
    assert_equal "A2", @player1.blocking_move

    @board.board[1][1].status = false
    @board.board[1][2].status = false
    assert_equal "B1", @player1.blocking_move

    @board.board[0][0].status = false
    @board.board[2][0].status = false
    assert_equal "B1", @player1.blocking_move

    @board.board[0][0].status = false
    @board.board[1][1].status = false
    assert_equal "C3", @player1.blocking_move

    @board.board[0][2].status = false
    @board.board[2][0].status = false
    assert_equal "B1", @player1.blocking_move
  end

  def test_computer_random_move
    assert @player1.random_move
  end


end
