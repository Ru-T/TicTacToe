require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require './board.rb'
require './position.rb'

class PositionTest < Minitest::Test

  def setup
    @position = Position.new
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
