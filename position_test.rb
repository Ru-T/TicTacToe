require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require './board.rb'
require './position.rb'

class PositionTest < Minitest::Test

  def test_position_class_exists
    assert Position
  end

end
