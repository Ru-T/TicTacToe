require 'byebug'
require './position.rb'
require './game.rb'

class Board

  attr_reader :board, :winning_lines, :spots

  def initialize
    @board = [[Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new],
             [Position.new, Position.new, Position.new]]
    @winning_lines = [
              [[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]],
              [[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]],
              [[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]
              ]
    @spots = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end

  def display_board
    @board.each do |row|
      row.each do |position|
        print "#{position}" + "|"
      end
      puts ""
    end
  end

  def full
    board.all? { |row|
      row.all? { |position| position.occupied }
    }
  end

  def x_of(letter)
    x_hash = { "A" => 0, "B" => 1, "C" => 2 }
    x_hash[letter[0]]
  end

  def y_of(number)
    y_hash = {"1" => 0, "2" => 1, "3" => 2}
    y_hash[number[1]]
  end

  def get_position(xy)
    letter_hash = { 0 => "A", 1 => "B", 2 => "C" }
    letter = letter_hash[xy[0][0]]
    number_hash = {0 => "1", 1 => "2", 2 => "3" }
    number = number_hash[xy[0][1]]
    "#{letter}" + "#{number}"
  end

  def open_spots(move)
    @spots.delete(move)
  end

end
