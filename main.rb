require_relative 'extract_data'
require_relative 'create_html_table'
require_relative 'Timetable'

# read local HTML into htmlDoc string
OriginalTimetable = "docs/SIRIS Timetable.html"
f = File.open(OriginalTimetable, 'r')
htmlDoc = f.read

#-- extract header data and print to console (will use later)
#-- Name, date, semester, etc.
#extract_header_data(htmlDoc).each { |header| print header + "\n" }
#print "\n"

#-- extract days and print to console (will use later)
#-- Monday, Tuesday...
#extract_days(htmlDoc).each { |day| print day + "\n" }
#print "\n"

# read local template file into html_template string
TemplateFile = "docs/timetable_template.html"
f = File.open(TemplateFile, 'r')
html_template = f.read

# extract timetable data, and feed it to create_html_table,
# along with template
#html_out = create_html_table(extract_timetable_data(htmlDoc), html_template)
tt = Timetable.new(extract_timetable_data(htmlDoc))
html_out = create_html_table(tt.to_a, html_template)

#-- debug: print final HTML to console
#print html_out

# output final HTML to table_out.html file
OutFile = "docs/table_out.html"
fout = File.open(OutFile, 'w')
fout.puts html_out
