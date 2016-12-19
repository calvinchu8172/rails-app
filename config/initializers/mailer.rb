Rails.application.configure do
  mailer_config = config_for(:mailer).deep_symbolize_keys

  config.action_mailer.delivery_method     = mailer_config[:delivery_method].to_sym
  config.action_mailer.smtp_settings       = mailer_config[:smtp_settings]
  config.action_mailer.default_options     = mailer_config[:default_options]
  config.action_mailer.default_url_options = mailer_config[:default_url_options]
end
