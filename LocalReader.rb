class LocalReader
  def self.read(inputFile)
    f = File.open(inputFile, 'r')
    return f.read
  end
end
