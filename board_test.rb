require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './board.rb'
require './position.rb'


class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_board_coordinates_of_position
    position = "A3"
    assert_equal 0, @board.x_of(position)
    assert_equal 2, @board.y_of(position)

    position2 = "C1"
    assert_equal 2, @board.x_of(position2)
    assert_equal 0, @board.y_of(position2)
  end

  def test_board_is_full
    refute @board.full

    @board.board[0][0].status = true
    @board.board[0][1].status = false
    @board.board[0][2].status = true
    @board.board[1][0].status = false
    @board.board[1][1].status = true
    @board.board[1][2].status = false
    @board.board[2][0].status = true
    @board.board[2][1].status = false
    @board.board[2][2].status = true

    assert @board.full
  end

  def test_get_position_from_coordinates
    xy = [0, 0]
    assert_equal "A1", @board.get_position(xy)

    xy2 = [1, 2]
    assert_equal "B3", @board.get_position(xy2)

    xy3 = [2, 1]
    assert_equal "C2", @board.get_position(xy3)
  end

  def test_open_spots
    move = "A3"
    assert_equal ["A1", "A2", "B1", "B2", "B3", "C1", "C2", "C3"], @board.open_spots(move)

    move2 = "C1"
    assert_equal ["A1", "A2", "B1", "B2", "B3", "C2", "C3"], @board.open_spots(move2)
  end

end
