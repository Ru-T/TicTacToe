require 'byebug'

class Position

  attr_accessor :status

  def initialize
    @status = nil
  end

  def occupied
    @status == true
  end

  def to_s
    if @status == nil
      "_"
    elsif @status == true
      "X"
    else @status == false
      "O"
    end
  end

end
