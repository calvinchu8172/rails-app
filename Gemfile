source 'https://rubygems.org'

gem 'rails', '5.0.0.1'
gem 'rails-i18n', '5.0.1'

# ------------ #
# - Database - #
# ------------ #

gem 'mysql2', '0.4.5'
gem 'bullet', '5.4.3', group: :development
gem 'sqlite3'

# ---------- #
# - Server - #
# ---------- #

gem 'puma', '3.6.2'

# --------- #
# - Debug - #
# --------- #

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  # 優化 console 顯示
  gem 'awesome_print', require: false
  gem 'hirb', require: false
  gem 'hirb-unicode', require: false
end

# Display full error content
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

# ------------ #
# - BDD Test - #
# ------------ #

group :test do
  gem 'cucumber', '1.3.20'
  gem 'cucumber-rails', '1.4.5', require: false
  gem 'selenium-webdriver', '2.53.4'
  gem 'database_cleaner', '1.5.3'
  gem 'rspec-rails', '3.5.2'
  gem 'factory_girl_rails', '4.7.0'
  gem 'webrat', '0.7.3'
  gem 'email_spec', '2.1.0'
  gem 'json_spec', '1.1.4'
  # Use SimpleCov test Cucumber coverage
  gem 'simplecov', '0.12.0', require: false
  gem 'rack_session_access', '0.1.1'
  gem 'timecop', '0.8.1'
  gem 'puffing-billy', '0.9.1'
  gem 'webmock', '2.3.1'
end

# ------- #
# - DOC - #
# ------- #

group :development, :test do
  gem 'yard', '0.8.7.6'
  gem 'yard-cucumber', '2.3.2'
  gem 'redcarpet'
  gem 'github-markup'
end

# --------- #
# - Model - #
# --------- #

gem 'validate_url'
gem 'activerecord-import', '0.16.2'
gem 'strip_attributes'
gem 'default_value_for'

# ---------- #
# - Logger - #
# ---------- #

gem 'logging-rails'
gem 'lograge'
gem 'silencer'

# --------- #
# - Tools - #
# --------- #

group :development, :test do
  gem 'i18n-docs'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'hamlit', '2.7.5'
gem 'letter_opener', group: :development
gem 'jbuilder', '~> 2.5'
gem 'nokogiri'
gem 'rest-client'
gem 'actionview-encoded_mail_to'

# ------ #
# - UI - #
# ------ #

gem 'sass-rails', '5.0.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'kaminari', '0.17.0'
gem 'simple_form', '3.2.1'
gem 'cocoon'
gem 'bower-rails', '0.11.0'
gem 'compass-rails', '3.0.2'
