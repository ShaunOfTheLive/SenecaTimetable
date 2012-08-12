require File.dirname(__FILE__) + '/extract_data.rb'
require File.dirname(__FILE__) + '/create_html_table.rb'

OriginalTimetable = "docs/SIRIS Timetable.html"
f = File.open(OriginalTimetable, 'r')
htmlDoc = f.read

extract_header_data(htmlDoc).each { |header| print header + "\n" }
print "\n"

extract_days(htmlDoc).each { |day| print day + "\n" }
print "\n"

TemplateFile = "docs/timetable_template.html"
f = File.open(TemplateFile, 'r')
html_template = f.read

html_out = create_html_table(extract_timetable_data(htmlDoc), html_template)

print html_out

OutFile = "docs/table_out.html"
fout = File.open(OutFile, 'w')
fout.puts html_out
