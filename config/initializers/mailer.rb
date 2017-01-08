Rails.application.configure do
  mailer_config = config_for(:mailer).deep_symbolize_keys

  config.action_mailer.delivery_method = mailer_config[:delivery_method].to_sym

  ActionMailer::Base.default(mailer_config[:default])
  ActionMailer::Base.smtp_settings       = mailer_config[:smtp_settings]
  ActionMailer::Base.default_url_options = mailer_config[:default_url_options]
end
