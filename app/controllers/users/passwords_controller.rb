class Users::PasswordsController < Devise::PasswordsController

  layout 'gentelella/devise'

  def update
    super do |resource|
      # 紀錄使用者修改密碼事件
      Log.write(resource, resource, 'reset_password') if resource.errors.empty?
    end
  end
end
