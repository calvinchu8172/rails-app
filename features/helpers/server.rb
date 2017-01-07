module ServerHelper
  def hostname
    "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
  end

  def fullpath(url)
    "#{hostname}#{url}"
  end
end

World ServerHelper
