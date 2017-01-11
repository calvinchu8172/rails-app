Then /^(?:|the .+ )should see "([^"]*)" - "([^"]*)" on ([^"]*) table Row "([^"]*)"$/ do |header, value, table_name, row|
  wait_for_ajax
  expect(table_content(table_name)[row.to_i - 1][header]).to have_content(value)
end

Then /^(?:|the .+ )should not see "([^"]*)" - "([^"]*)" on ([^"]*) table Row "([^"]*)"$/ do |header, value, table_name, row|
  wait_for_ajax
  expect(table_content(table_name)[row.to_i - 1][header]).to_not have_content(value)
end

When /^(?:|the .+ )clicks "([^"]*)" link on ([^"]*) table Row "([^"]*)"$/ do |link_text, table_name, row|
  wait_for_ajax
  with_scope(table_selector(table_name)) do
    all('tr a')[row.to_i - 1].click
  end
end
