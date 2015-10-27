require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './board.rb'

class ComputerPlayerTest < Minitest::Test

  def setup
    @board = Board.new
    @computerplayer = ComputerPlayer.new("Unbeatable", @board)
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




  end

  def test_computer_random_move

  end


end
