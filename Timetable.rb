require_relative 'Event'

class Timetable
  # @eventHash:
  #   a hash[array[Day, Time]] of Events

  def initialize(events)
  # acceptable inputs:
  # events: a 2D array of Events, or a 2D array of Arrays
  # (Arrays will be converted into Events)

  # TODO: for each 2-deep element, we must check whether it's enumerable
  # and if it is, use it to construct a Event
  # or check if it's already a Event
  # otherwise, throw an exception

    raise "Timetable must be constructed with a list!" if !events.respond_to?('each')
    @eventHash = events.map do |row|
      row.map do |cell|
        if cell.is_a? Event
          cell
        elsif cell.respond_to?('each')
          Event.new(*cell)
        else
          raise "2-deep element must be a Event, or respond to 'each'"
        end
      end
    end
  end

  def to_a
    @eventHash
  end
end

