require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './board.rb'

class ComputerPlayerTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_take_turn
    @turn == 0
    @computerplayer.take_turn
    assert @turn == 1
  end

  def test_computer_first_move
    @turn == 0
    assert_equal "B2", @computerplayer.computer_turn
  end

  def test_computer_second_move
    @turn == 1
    @board.board[1][0].occupied
    assert_equal "A3", @computerplayer.computer_turn

    @turn == 1
    @board.board[0][1].occupied
    assert_equal "C1", @computerplayer.computer_turn

    @turn == 1
    @board.board[1][2].occupied
    assert_equal "A1", @computerplayer.computer_turn

    @turn == 1
    @board.board[0][0].occupied
    assert_equal "C3", @computerplayer.computer_turn
  end

  def test_computer_blocking_move
    @board.board[0][0].status = false
    @board.board[0][2].status = false
    assert_equal "A2", @computerplayer.blocking_move

    @board.board[1][1].status = false
    @board.board[1][2].status = false
    assert_equal "B1", @computerplayer.blocking_move

    @board.board[0][0].status = false
    @board.board[2][0].status = false
    assert_equal "B1", @computerplayer.blocking_move

    @board.board[0][0].status = false
    @board.board[1][1].status = false
    assert_equal "C3", @computerplayer.blocking_move

    @board.board[0][2].status = false
    @board.board[2][0].status = false
    assert_equal "B1", @computerplayer.blocking_move
  end

  def test_computer_random_move
    @board.spots = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    assert @computerplayer.random_move
  end


end
