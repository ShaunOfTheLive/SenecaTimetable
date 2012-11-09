require_relative 'Block'

class Timetable
  # @blocks is a 2D array (rows, cols) of Blocks
  @blocks

  def initialize(blocks)
  # acceptable inputs:
  # blocks: a 2D array of Blocks, or a 2D array of Arrays
  # (Arrays will be converted into Blocks)

  # TODO: for each 2-deep element, we must check whether it's enumerable
  # and if it is, use it to construct a Block
  # or check if it's already a Block
  # otherwise, throw an exception

    raise "Timetable must be constructed with a list!" if !blocks.respond_to?('each')
    @blocks = blocks.map do |row|
      row.map do |cell|
        if cell.is_a? Block
          cell
        elsif cell.respond_to?('each')
          Block.new(*cell)
        else
          raise "2-deep element must be a Block, or respond to 'each'"
        end
      end
    end
  end

  def to_a
    @blocks
  end
end

