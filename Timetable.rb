class Timetable
  def initialize(blocks)
  #TODO: if list of lists, make each sub-list into a Block
  # actually, for EACH element, we must check whether it's enumerable
  # and if it is, use it to construct a Block
  # or check if it's already a Block
  # otherwise, throw an exception
    if @blocks.respond_to?('each')
      @blocks = blocks
    else
      raise "Timetable must be constructed with a list!"
    end
  end

  def to_a
    @blocks
  end
end

