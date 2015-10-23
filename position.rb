require 'byebug'

class Position

  attr_accessor :status

  def initialize
    @status = nil
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

  def occupied
    @status == true || @status == false
  end

end
