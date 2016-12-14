require 'billy/capybara/cucumber'

Before '@proxy' do
  Capybara.current_driver = :selenium_billy
  proxy.stub('http://www.google.com/').and_return(text: 'I am faker website!')
end

After '@proxy' do
  Capybara.use_default_driver
end
