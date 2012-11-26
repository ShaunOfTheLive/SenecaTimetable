require_relative 'Event'

class CourseEvent < Event
  attr_accessor :room
  #@courseObj
  
  def initialize(day, startTime, endTime, courseObj, room, description=nil)
    super(day, startTime, endTime, description)
    @room = room
    @courseObj = courseObj
  end
end
