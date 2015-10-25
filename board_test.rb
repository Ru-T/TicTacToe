require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require './board.rb'
require './position.rb'


class BoardTest < Minitest::Test

  def test_board_class_exists
    assert Board
  end

  def test_human_and_computer_game
    board = Board.new

    assert board.play


    
  end

  def test_human_place_on_board
    player1 = @player1
        $mock_inputs.clear
        $mock_inputs << "A2"
        assert_output("Alice, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                      "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                      "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"+
                      "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n") do
          player.place_ships([2, 3])
        end
        assert_equal 2, player.ships.length
        assert_equal 3, player.ships[1].length
        assert player.grid.has_ship_on?(2, 1)
        assert player.grid.has_ship_on?(2, 2)
        assert player.grid.has_ship_on?(1, 6)
        refute player.grid.has_ship_on?(1, 1)
  end

end
