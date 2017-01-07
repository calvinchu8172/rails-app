class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit
    resource.build_profile if resource.profile.nil?
  end

  def update
    super do |resource|
      # 紀錄使用者修改密碼事件
      Log.write(resource, resource, 'changed_password') if resource.errors.empty?
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [
        { profile_attributes: [:id, :name] }
      ])
    end
end
