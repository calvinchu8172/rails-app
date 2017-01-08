class Users::InvitationsController < Devise::InvitationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    # CanCanCan
    authorize! :invite, User

    self.resource = resource_class.new
    self.resource.build_profile if self.resource.profile.nil?

    render :new
  end

  def create
    # CanCanCan
    authorize! :invite, User

    super do |resource|
      # 紀錄邀請會員事件
      Log.write(current_user, resource, 'invited_user') if resource.errors.empty?
    end
  end

  def update
    super do |resource|
      # 紀錄會員接受邀請事件
      Log.write(resource, resource.invited_by, 'accepted_invitation') if resource.errors.empty?
    end
  end

  def after_invite_path_for(resource)
    admin_users_url
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [
        { profile_attributes: [:id, :role] }
      ])
    end
end
