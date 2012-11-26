require_relative 'Event'
require_relative 'Course'

class Timetable
  # @eventHash:
  #   a hash[array[Day, Time]] of Events
  # @courseHash:
  #   a hash[subject] of Courses

  def initialize(events)
  # acceptable inputs:
  # events: a 2D array of Events, or a 2D array of Arrays
  # (Arrays will be converted into Events)

    raise "Timetable must be constructed with a list!" if !events.respond_to?('each')
    @eventHash = new Hash
    events.map do |row|
      # TODO: put proper Time constructor here
      # startTime = row.shift
      row.map do |cell|
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
              # description = args[0]
            end
          when 3, 4
            subject, teacher, room = cell if cell.length == 3
            subject, teacher, room, colour = cell if cell.length == 4
            if courseHash.has_key?(subject)
              if teacher != courseHash[subject].teacher
                raise "Same course subject defined twice with different teacher!"
              end
            else
              courseHash[subject] = new Course(subject, teacher)
              # eventHash[[day, startTime]] = new CourseEvent(
              #   day, startTime, startTime+45min, courseHash[subject], room)
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

