require 'byebug'

class Position

attr_accessor :status
attr_reader :name

  def initialize(name)
    @status = "_"
    @name = name
  end

end
