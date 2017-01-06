class SuperAdmin::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    # 當已經有超級管理員時，則跳回首頁
    redirect_to root_url and return if User.super_admins.present?
    # 清除 flash 訊息
    flash.clear
    super
  end

  def create
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      # 更新 user.profile.role = super_admin
      resource.super_admin!
      # 紀錄管理員註冊事件
      Log.write(resource, resource, 'super_admin_signed_up')
      expire_data_after_sign_in!
      flash[:notice] = t('user.messages.super_admin_sign_up_success', email: resource.email)
      redirect_to new_user_session_url
    else
      clean_up_passwords resource
      # set_minimum_password_length
      respond_with resource
    end
  end

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
