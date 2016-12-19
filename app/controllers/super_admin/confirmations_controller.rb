class SuperAdmin::ConfirmationsController < Devise::ConfirmationsController

  layout 'gentelella/devise'

  def new
    # 當已經有管理員且已經驗證過時，則跳回首頁
    redirect_to new_user_session_path and return if User.super_admins.first.confirmed?
    super
  end
end
