class Admin::UsersController < AdminController

  load_and_authorize_resource except: 'change_settings'

  def index
    @users = @users.includes(:profile)
    @users = @users.not_super_admin unless current_user.super_admin?
  end

  def show
  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: I18n.t('user.messages.edit_success', email: @user.email)
    else
      render :edit
    end
  end

  def lock
    if @user.lock_access!(send_instructions: false)
      # 紀錄鎖定會員紀錄
      Log.write(current_user, @user, 'lock_user')
      redirect_to admin_user_url(@user), notice: I18n.t('user.messages.lock_success', email: @user.email)
    end
  end

  def unlock
    if @user.unlock_access!
      # 紀錄解鎖會員事件
      Log.write(current_user, @user, 'unlock_user')
      redirect_to admin_user_url(@user), notice: I18n.t('user.messages.unlock_success', email: @user.email)
    end
  end

  def resent_invitation
    @user.invite!
    redirect_to admin_user_url(@user), notice: I18n.t('user.messages.resent_invitation_success', email: @user.email)
  end

  private

    def user_params
      params.require(:user).permit(profile_attributes: [:id, :role])
    end
end
