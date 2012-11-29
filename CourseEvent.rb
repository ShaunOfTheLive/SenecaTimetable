require_relative 'Event'

class CourseEvent < Event
  attr_accessor :room
  #@courseObj
  
  def initialize(day, startTime, endTime, courseObj, room, description=nil)
    super(day, startTime, endTime, description)
    @room = room
    @courseObj = courseObj
  end
  
  def getStartTimeStr
    return startTime.strftime("%H:%M")
  end
  
  def getEndTimeStr
    return endTime.strftime("%H:%M")
  end
  
  def to_csv
    array = [@day, getStartTimeStr, getEndTimeStr, @courseObj.subject, @courseObj.teacher, @room, @description]
    array.compact!
    return array.join(", ")
  end
end
