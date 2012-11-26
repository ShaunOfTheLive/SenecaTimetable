require_relative 'Event'

class Timetable
  # @eventHash:
  #   a hash[array[Day, Time]] of Events

  def initialize(events)
  # acceptable inputs:
  # events: a 2D array of Events, or a 2D array of Arrays
  # (Arrays will be converted into Events)

    raise "Timetable must be constructed with a list!" if !events.respond_to?('each')
    @eventHash = events.map do |row|
      row.map do |cell|
        if cell.is_a? Event
          cell
        elsif cell.respond_to?('each')
          Event.new(*cell)
        else
          raise "2-deep element must be an Event, or respond to 'each'"
        end
      end
    end
  end

  def to_a
    @eventHash
  end
end

