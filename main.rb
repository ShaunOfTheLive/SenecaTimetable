# readers
require_relative 'LocalReader'

require_relative 'Parser'

require_relative 'Timetable'

# formatters
require_relative 'HtmlFormatter'


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

# read local template file into html_template string
html_template = LocalReader.read("docs/timetable_template.html")

# extract timetable data, and feed it to HtmlFormatter.format,
# along with template
#html_out = HtmlFormatter.format(Parser.parseBody(htmlDoc), html_template)
tt = Timetable.new(Parser.parseBody(htmlDoc))
html_out = HtmlFormatter.format(tt.to_a, html_template)

#-- debug: print final HTML to console
#print html_out

# output final HTML to table_out.html file
OutFile = "docs/table_out.html"
fout = File.open(OutFile, 'w')
fout.puts html_out
