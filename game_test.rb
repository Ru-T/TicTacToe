require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './computer_player.rb'
require './human_player.rb'
require './board.rb'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_set_up_game

  end

  def test_play_game

  end

  def test_players_take_turns
    take_turn
    refute @p1_turn

    take_turn
    assert @p1_turn
  end

  def test_game_has_a_winner
    refute winner

    @board.board[0][0].status = true
    @board.board[0][1].status = true
    refute winner

    @board.board[0][0].status = true
    @board.board[0][1].status = true
    @board.board[0][2].status = true
    assert winner

    @board.board[0][0].status = true
    @board.board[1][0].status = true
    @board.board[2][0].status = true
    assert winner

    @board.board[0][0].status = true
    @board.board[1][1].status = true
    @board.board[2][2].status = true
    assert winner
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
