require 'time'

require_relative 'Event'
require_relative 'Course'
require_relative 'CourseEvent'
#require_relative 'Parser' # delete this when we move list processing code out

class Timetable
  # @eventHash:
  #   a hash[array[Day, Time]] of Events
  # @courseHash:
  #   a hash[subject] of Courses



  @@days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  def addEvent(day, startTime, endTime, description=nil)
    @eventHash[[day, startTime]] = Event.new(day, startTime, startTime+50*60, description)
  end
  
  def addCourseEvent(day, startTime, endTime, subject, room, description=nil)
    @eventHash[[day, startTime]] = CourseEvent.new(day, startTime, startTime+50*60, @courseHash[subject], room)
  end
  
  def addCourse(subject, teacher)
    if @courseHash.has_key?(subject)
      if teacher != @courseHash[subject].teacher
        raise "Same course subject defined twice with different teacher!"
      end
    else
      @courseHash[subject] = Course.new(subject, teacher)
    end
    return @courseHash[subject]
  end
  
  def getCourse(subject)
    return @courseHash[subject]
  end
  
  def getCourseList
    #TODO
  end

  def initialize(events)
  # acceptable inputs:
  # events: a 2D array of Events, or a 2D array of Arrays
  # (Arrays will be converted into Events)

    raise "Timetable must be constructed with a list!" if !events.respond_to?('each')
    
    @eventHash = Hash.new
    @courseHash = Hash.new
    
    events.map do |row|

      startTime = Time.parse(row.shift.join)

      row.zip(@@days).map do |cell, day|
        event = nil
        if cell.is_a? Event
          event = cell
        elsif cell.respond_to?('each')
          case cell.length
          when 0
            raise "Cell must contain at least one element!"
          when 1
            if cell[0] == "-"
              # do nothing; no object will be created
            else
              addEvent(day, startTime, startTime+45*60, cell[0])
            end
          when 3, 4
            subject, teacher, room = cell if cell.length == 3
            subject, teacher, room, colour = cell if cell.length == 4
            course = addCourse(subject, teacher)
            addCourseEvent(day, startTime, startTime+45*60, course.subject, room)
          else
            raise "Illegal number of elements in cell!"
          end
        else
          raise "2-deep element must be an Event, or respond to 'each'"
        end
      end
    end
  end

  def to_csv
    array = Array.new
    sorted_keys = @eventHash.keys.sort_by{ |a,b| [@@days.find_index(a), b] }
=begin 
    puts "###KEYS\n"
    puts sorted_keys
    puts "###END KEYS\n"
=end
    sorted_values = @eventHash.values_at(*sorted_keys)
=begin
    puts "###VALUES\n"
    puts sorted_values
    puts "###END VALUES\n"
=end
    array = sorted_values.map{ |event| event.to_csv}
    return array.join("\n")
  end
end

