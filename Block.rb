class Block
  attr_accessor :course, :professor, :room, :colour, :string

  def initialize(*args)
    case args.length
    when 0
      raise "You must pass at least one argument to the constructor!"
    when 1
      @string = args[0]
    when 3
      @course, @professor, @room = args
    when 4
      @course, @professor, @room, @colour = args
    else
      raise "Illegal number of arguments!"
    end
  end

  def to_a
    if defined?(@string)
      return [@string]
    else
      return [@course, @professor, @room, @colour]
    end
  end
end

