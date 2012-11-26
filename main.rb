# readers
require_relative 'LocalReader'
require_relative 'Parser'
require_relative 'Timetable'

# formatters
require_relative 'HtmlFormatter'
require_relative 'LocalWriter'

# read local HTML into htmlDoc string
htmlDoc = LocalReader.read("docs/SIRIS Timetable.html")

tt = Timetable.new(Parser.parseBody(htmlDoc))
html_template = LocalReader.read("docs/timetable_template.html")
#this is using old to_a method
#html_out = HtmlFormatter.format(tt.to_a, html_template)

#LocalWriter.write("docs/table_out.html", html_out)

puts tt.to_csv
