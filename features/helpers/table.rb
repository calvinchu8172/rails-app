module TableHelper
  def table_content(table_name)
    selector = table_selector(table_name)
    doc      = Nokogiri::HTML.parse(page.html)
    headers  = doc.css("#{selector} thead tr th").map{ |th| th.content.strip.squish }
    rows     = doc.css("#{selector} tbody tr").map do |tr|
      tr.css('td').map do |td|
        table_html?(table_name) ? td : td.content.strip.squish
      end
    end
    @table_content = rows.map { |row| headers.zip(row).to_h }
  end

  def table_selector(table_name)
    case table_name
    when ''
    else
      '.data_table'
    end
  end

  def table_html?(table_name)
    case table_name
    when ''
    else
      false
    end
  end
end

World TableHelper
