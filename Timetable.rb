require_relative 'Block'

class Timetable
  def initialize(blocks)
  # acceptable inputs:
  # blocks: a 2D array of Blocks, or a 2D array of Arrays
  # (Arrays will be converted into Blocks)

  # TODO: for each 2-deep element, we must check whether it's enumerable
  # and if it is, use it to construct a Block
  # or check if it's already a Block
  # otherwise, throw an exception

  # @blocks is a 2D array (rows, cols) of Blocks
    raise "Timetable must be constructed with a list!" if !blocks.respond_to?('each')
    blocks.map do |block|
      if block.is_a? Block
        block
      elsif block.respond_to?('each')
        print block
        Block.new(*block)
      else
        raise "Element must be a Block, or respond to 'each'"
      end
    end
  end

  def to_a
    @blocks
  end
end

