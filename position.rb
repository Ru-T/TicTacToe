require 'byebug'

class Position

  attr_accessor :status

  def initialize
    @status = nil
  end

  private def to_s
    if @status == nil
      "_"
    elsif @status == true
      "X"
    else @status == false
      "O"
    end
  end

  def occupied
    @status != nil
  end

end
