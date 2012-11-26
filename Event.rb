class Event
  attr_accessor :day, :startTime, :endTime, :description

  def initialize(day, startTime, endTime, description=nil)
    @day = day
    @startTime = startTime
    @endTime = endTime
    @description = description
  end

  def to_csv
    array = [@day, @startTime, @endTime, @description]
    return array.join(", ")
  end
end

