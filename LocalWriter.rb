class LocalWriter
  def self.write(outputFile, s)
    f = File.open(outputFile, 'w')
    f.puts s
  end
end
