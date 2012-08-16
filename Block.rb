class Block
  attr_accessor :course, :professor, :room, :colour

  def initialize(course, professor, room, colour = nil)
    @course = course
    @professor = professor
    @room = room
    @colour = colour
  end

  def to_a
    [@course, @professor, @room, @colour]
  end
end

