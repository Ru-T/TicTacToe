require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './computer_player.rb'
require './human_player.rb'
require './board.rb'
require './game.rb'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @board = Board.new
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


end
