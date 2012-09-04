class LocalReader
  def self.read(inputFile = "docs/SIRIS Timetable.html")
    f = File.open(inputFile, 'r')
    return f.read
  end
end
