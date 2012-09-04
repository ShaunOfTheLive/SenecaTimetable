class Parser
  def self.parseHeaders(htmlDoc)
    raise "htmlDoc must not be empty" if htmlDoc.nil?
  
    if htmlDoc.respond_to?("join")
      htmlDoc = htmlDoc.join
    end

    # read header values
    # (Name, Semester, etc.)

    headers = [
      "Name",
      "Date of Printing",
      "Semester and Year",
      "Faculty/Location",
      "Program and Semester",
      "School"
    ]

    header_values = headers.map do |header|
      regex = /#{Regexp.escape(header)}:<\/td><td id='subhead'>(.*?)<\/td>/
      regex.match(htmlDoc)[1].
        gsub(/&nbsp;/, ' ')
    end

    return header_values
  end

  def self.parseDays(htmlDoc)
    regex = /<tr><td id='subheadbgl'>.*<\/tr>/
    row = regex.match(htmlDoc)[0].
      gsub(/&nbsp;/, '')
    
    regex = /<th id='subheadbgl'>(.*?)<\/th>/
    days = row.scan(regex).flatten

    return days
  end

  def self.parseBody(htmlDoc)
    regex = /<tr>.+<td id='bold'>.*<\/tr>/m
    row = regex.match(htmlDoc)[0].
      gsub(/&nbsp;/, '').
      gsub(/<br>/, "\n")

    #print row

    regex = /<td id='bold'.*?>(.*?)<\/td>/m
    columns = row.scan(regex).
      flatten

    columns = columns.map { |column| column.strip.
      gsub(/\n\n/, "\n").
      split("\n")
    }

    columns = columns.map { |column| column.map { |item| item.strip } }

    table = Array.new(columns.count / 6) { |i| columns.slice(i * 6, 6) }

    return table
  end
end

