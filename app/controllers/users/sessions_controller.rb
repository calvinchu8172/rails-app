class Users::SessionsController < Devise::SessionsController

  def new
    # # 當無任何超級管理員時，則跳轉到超級管理員註冊頁面
    redirect_to super_admin_sign_up_url and return if User.super_admin.blank?
    # 載入上次登入的 Email 資訊
    if cookies[:email].present?
      params[:user] = { email: cookies[:email] }
      params[:remember_me] = '1'
    end
    super
  end

  def create
    super do |resource|
      # 儲存此次登入的 Email 資訊
      # 儲存此次登入的 Email 資訊
      if params[:remember_me] == '1'
        cookies.permanent[:email] = { value: params[:user][:email], httponly: true }
      else
        cookies.delete(:email)
      end
    end
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end
end
