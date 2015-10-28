require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './game.rb'
require './board.rb'
require './computer_player.rb'
require './human_player.rb'
require './position.rb'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @board = Board.new
    @player1 = ComputerPlayer.new("Unbeatable", @board)
    @position = Position.new
  end

  def test_set_up_game

  end

  def test_play_game

  end

  def test_players_take_turns
    assert_equal false, @game.take_turn
    assert_equal true, @game.take_turn
  end

  def test_game_has_a_winner
    @game.winner
    assert_equal 0, @win

    @board.board[0][0].status = true
    @board.board[0][1].status = true
    @game.winner
    assert_equal 0, @win

    @board.board[0][0].status = true
    @board.board[0][1].status = true
    @board.board[0][2].status = true
    @game.winner
    assert_equal 1, @win

    @board.board[0][0].status = true
    @board.board[1][0].status = true
    @board.board[2][0].status = true
    @game.winner
    assert_equal 1, @win

    @board.board[0][0].status = true
    @board.board[1][1].status = true
    @board.board[2][2].status = true
    @game.winner
    assert_equal 1, @win
  end

  def text_game_ends_in_a_draw
    refute draw?

    @board.board[0][0].status = true
    @board.board[0][1].status = false
    @board.board[0][2].status = true
    @board.board[1][0].status = false
    @board.board[1][1].status = true
    @board.board[1][2].status = false
    @board.board[2][0].status = true
    @board.board[2][1].status = false
    @board.board[2][2].status = true
    assert draw?

    @board.board[0][0].status = true
    @board.board[0][1].status = false
    @board.board[0][2].status = true
    @board.board[1][0].status = false
    @board.board[1][1].status = true
    @board.board[1][2].status = false
    @board.board[2][0].status = true
    @board.board[2][1].status = false
    @board.board[2][2].status = true
    assert draw?
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
    xy = [[0, 0]]
    assert_equal "A1", @board.get_position(xy)

    xy2 = [[1, 2]]
    assert_equal "B3", @board.get_position(xy2)

    xy3 = [[2, 1]]
    assert_equal "C2", @board.get_position(xy3)
  end

  def test_open_spots
    move = "A3"
    @board.open_spots(move)
    assert_equal ["A1", "A2", "B1", "B2", "B3", "C1", "C2", "C3"], @board.spots

    move2 = "C1"
    @board.open_spots(move2)
    assert_equal ["A1", "A2", "B1", "B2", "B3", "C2", "C3"], @board.spots
  end

  def test_take_turn
    assert_equal 1, @player1.take_turn
  end

  def test_computer_first_move
    assert_equal "B2", @player1.computer_turn
  end

  def test_computer_second_move
    @player1.computer_turn
    @board.board[2][0].occupied
    assert_equal "A3", @player1.computer_turn

    @player1.take_turn
    @board.board[0][1].occupied
    assert_equal "C1", @player1.computer_turn

    @player1.take_turn
    @board.board[1][2].occupied
    assert_equal "A1", @player1.computer_turn

    @player1.take_turn
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
    assert_equal "B2", @player1.blocking_move
  end

  def test_computer_random_move
    assert @player1.random_move
  end

  def test_position_status
    @position.status = nil
    assert "_"
    @position.status = true
    assert "X"
    @position.status = false
    assert "O"
  end

  def test_position_occupied
    @position.status = nil
    refute @position.occupied

    @position.status = true
    assert @position.occupied

    @position.status = false
    assert @position.occupied
  end

end
