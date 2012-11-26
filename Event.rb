class Event
  attr_accessor :day, :startTime, :endTime, :description

  def initialize(day, startTime, endTime, description=nil)
    @day = day
    @startTime = startTime
    @endTime = endTime
    @description = description
  end

  def to_a
    if defined?(@string)
      if @string.nil?
        return ["-"]
      else
        return [@string]
      end
    else
      return [@course, @professor, @room]
    end
  end
end

