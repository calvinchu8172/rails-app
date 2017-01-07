module AjaxHelper
  def wait_for_ajax
    if Capybara.current_driver == :selenium
      Timeout.timeout(Capybara.default_max_wait_time) do
        loop do
          active = page.evaluate_script('jQuery.active')
          break if active == 0 || active.nil?
        end
      end
    end
  end
end

World AjaxHelper
