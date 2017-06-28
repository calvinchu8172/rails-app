# encoding: utf-8
require 'yaml'
require 'rails'

# 執行 rails best practice 會先跑自訂的規則再跑 yml 的規則
# 為了透過 yml 管理自訂的規則，會將 yml 的 key 與自訂的 class name 同名
# 當載入 yml 後即可以這樣方式取得設定值 true | false 來達到開關效果

module RailsBestPractices

  class CheckFileExtensionLowercase < Rails::Application

    def yml_path
      # EX: /path_to/config/rails_best_practices.yml
      File.join(::Rails.root, 'config/rails_best_practices.yml')
    end

    def yml_settings
      # EX: { "CheckFileExtensionLowercase" => true }
      YAML.load(File.read(yml_path))
    end

    def enable?
      # Set CheckFileExtensionLowercase default value to false
      yml_settings.fetch(self.class.name.demodulize, false)
    end

    def check_extension!
      errors = false
      Dir['*/**/*.*'].each do |file_path|
        extname = File.extname(file_path).delete('.')
        if extname.match(/[A-Z]/)
          puts "The file extension name contains uppercase => #{ file_path }"
          errors = true
        end
      end

      abort("Illegal file extension found ...") if errors
    end

    if enable?
      check_extension!
    end

  end
end
