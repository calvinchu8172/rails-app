require 'billy/capybara/cucumber'

# for chrome
Capybara.register_driver :selenium_chrome_billy do |app|
  switches = [
    '--disable-gpu',
    '--no-sandbox',
    '-disable-infobars',
    '--ignore-certificate-errors',
    '--disable-popup-blocking',
    '--disable-translate',
    '--window-position=0,0',
    '--window-size=1280,1000',
    "--proxy-server=#{Billy.proxy.host}:#{Billy.proxy.port}"
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

Before '@proxy' do
  Capybara.current_driver = :selenium_chrome_billy
  proxy.stub('http://www.google.com/').and_return(text: 'I am faker website!')
end

After '@proxy' do
  Capybara.use_default_driver
end
