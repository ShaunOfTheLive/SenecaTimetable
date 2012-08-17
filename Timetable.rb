require_relative 'Block'

class Timetable
  def initialize(blocks)
  #TODO: if list of lists, make each sub-list into a Block
  # actually, for EACH element, we must check whether it's enumerable
  # and if it is, use it to construct a Block
  # or check if it's already a Block
  # otherwise, throw an exception
    raise "Timetable must be constructed with a list!" if !blocks.respond_to?('each')
    blocks.map do |block|
      if block.is_a? Block
        block
      elsif block.respond_to?('each')
        Block.new(block)
      else
        raise "Element must be a Block, or respond to 'each'"
      end
    end
    end
  end

  def to_a
    @blocks
  end
end

