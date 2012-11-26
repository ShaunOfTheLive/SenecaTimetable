require_relative 'Event'
require_relative 'Course'
#require_relative 'Parser' # delete this when we move list processing code out

class Timetable
  # @eventHash:
  #   a hash[array[Day, Time]] of Events
  # @courseHash:
  #   a hash[subject] of Courses

  def addEvent(day, startTime, endTime, description=nil)
    eventHash[[day, startTime]] = new Event(day, startTime, startTime+45*60, description)
  end
  
  def addCourse(subject, teacher)
    if courseHash.has_key?(subject)
      if teacher != courseHash[subject].teacher
        raise "Same course subject defined twice with different teacher!"
      end
    else
      courseHash[subject] = new Course(subject, teacher)
    end
    return courseHash[subject]
  end
  
  def getCourse(subject)
    return courseHash[subject]
  end
  
  def addCourseEvent(day, startTime, endTime, subject, room, description=nil)
    eventHash[[day, startTime]] = new CourseEvent(day, startTime, startTime+45*60, courseHash[subject], room)
  end

  def initialize(events)
  # acceptable inputs:
  # events: a 2D array of Events, or a 2D array of Arrays
  # (Arrays will be converted into Events)

    raise "Timetable must be constructed with a list!" if !events.respond_to?('each')
    @eventHash = new Hash
    events.map do |row|
      # TODO: put proper Time constructor here
      # startTime = row.shift
      days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
      row.zip(days).map do |cell, day|
        event
        if cell.is_a? Event
          event = cell
        elsif cell.respond_to?('each')
          case cell.length
          when 0
            raise "Cell must contain at least one element!"
          when 1
            if args[0] == "-"
              # do nothing; no object will be created
            else
              ## create new standard Event with description
              ## assume endTime is startTime+45*60 for now (?)
              # eventHash[[day, startTime]] = new Event(
              #  day, startTime, startTime+45*60, args[0])
            end
          when 3, 4
            subject, teacher, room = cell if cell.length == 3
            subject, teacher, room, colour = cell if cell.length == 4
            course = addCourse(subject, teacher)
            addCourseEvent(day, startTime, startTime+45*60, course, room)
            end
          else
            raise "Illegal number of elements in cell!"
          end
          event = Event.new(*cell)
        else
          raise "2-deep element must be an Event, or respond to 'each'"
        end
        @eventHash[[event.day(), event.startTime()]] = event;
      end
    end
  end

  def to_a
    @eventHash
  end
end

