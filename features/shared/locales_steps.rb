Given /^the locale has been changed to "([^"]*)"$/ do |locale|
  I18n.locale = locale.to_sym
end

Then /^the value of I18n key "([^"]*)" should be "([^"]*)"$/ do |key, value|
  expect(I18n.t(key)).to eq(value)
end

When /^(?:|the .+ )selects Language "([^"]*)"$/ do |language|
  select(language, from: 'locale')
  wait_for_ajax
end
