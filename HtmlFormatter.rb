class HtmlFormatter
  def self.format(table, template)
    title = "Timetable!!!"

    body = ""
    table.each do |row|
      body += " "*6 + "<tr>" + "\n"
      row.each do |column| 
        body += " "*8 + "<td>"
        body += column.to_a.join("<br />\n" + " "*12)
        body += "</td>" + "\n"
      end
      body += " "*6 + "</tr>" + "\n"
    end
    body.strip!

    template.gsub!("`title`", title);
    template.gsub!("`table_body`", body);

    return template
  end
end
