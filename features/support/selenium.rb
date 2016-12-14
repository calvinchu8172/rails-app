Capybara.default_max_wait_time = 20 # Default is 2

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = Rails.root.join('tmp', 'downloads').to_s
  profile['browser.download.folderList'] = 2
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/xlsx'
  profile['browser.download.manager.showWhenStarting'] = false
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 120
  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile, http_client: http_client)
end
