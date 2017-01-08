class SuperAdmin::ConfirmationsController < Devise::ConfirmationsController

  def new
    # 當已經有超級管理員且已經驗證過時，則跳回首頁
    redirect_to new_user_session_path and return if User.super_admin.first.confirmed?
    super
  end
end
