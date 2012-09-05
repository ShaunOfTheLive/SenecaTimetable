# readers
require_relative 'LocalReader'

require_relative 'Parser'

require_relative 'Timetable'

# formatters
require_relative 'HtmlFormatter'

require_relative 'LocalWriter'


# read local HTML into htmlDoc string
htmlDoc = LocalReader.read("docs/SIRIS Timetable.html")

#-- extract header data and print to console (will use later)
#-- Name, date, semester, etc.
#Parser.parseHeaders(htmlDoc).each { |header| print header + "\n" }
#print "\n"

#-- extract days and print to console (will use later)
#-- Monday, Tuesday...
#Parser.parseDays(htmlDoc).each { |day| print day + "\n" }
#print "\n"

tt = Timetable.new(Parser.parseBody(htmlDoc))
html_template = LocalReader.read("docs/timetable_template.html")
html_out = HtmlFormatter.format(tt.to_a, html_template)

LocalWriter.write("docs/table_out.html", html_out)
