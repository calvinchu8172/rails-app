require 'cucumber/formatter/html'

class EcoworkFormatter < Cucumber::Formatter::Html

  def inline_css
    @builder.style(type: 'text/css') do
      @builder << File.read(File.dirname(__FILE__) + '/ecowork.css')
    end
    super
  end
end
