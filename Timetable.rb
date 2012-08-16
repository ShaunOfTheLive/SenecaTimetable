class Timetable
	def initialize(blocks)
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

