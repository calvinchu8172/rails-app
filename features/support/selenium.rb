Capybara.javascript_driver = :selenium_chrome
Capybara.default_max_wait_time = 20 # Default is 2

# for firefox 46
Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = Rails.root.join('tmp', 'downloads').to_s
  profile['browser.download.folderList'] = 2
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  profile['browser.download.manager.showWhenStarting'] = false
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 240
  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile, http_client: http_client)
end

# for chrome
Capybara.register_driver :selenium_chrome do |app|
  switches = [
    '--disable-gpu',
    '--no-sandbox',
    '--disable-infobars',
    '--ignore-certificate-errors',
    '--disable-popup-blocking',
    '--disable-translate',
    '--window-position=0,0',
    '--window-size=1280,1000'
  ]
  prefs = {
    # auto download
    download: {
      prompt_for_download: false,
      default_directory: Rails.root.join('tmp', 'downloads').to_s
    },
    # disable password manager
    credentials_enable_service: false,
    profile: {
      password_manager_enabled: false
    }
  }
  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    switches: switches,
    prefs: prefs,
    http_client: Selenium::WebDriver::Remote::Http::Default.new(
      open_timeout: 240, read_timeout: 240
    )
  )
end
