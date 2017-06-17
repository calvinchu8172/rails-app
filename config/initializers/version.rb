APP_FULL_VERSION   = File.read(Rails.root.join('VERSION')).strip
APP_SIMPLE_VERSION = APP_FULL_VERSION.split('-').first
