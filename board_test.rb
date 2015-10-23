require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require './board.rb'
require './position.rb'


class BoardTest < Minitest::Test

  def test_board_class_exists
    assert Board
  end



end
