class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      send("load_#{user.profile.role}_permissions", user)
    end
  end

  private

    # -------------------- #
    # - 載入超級管理員權限 - #
    # -------------------- #

    def load_super_admin_permissions(user)
      can :manage, :all
    end

    # ---------------- #
    # - 載入管理員權限 - #
    # ---------------- #

    def load_admin_permissions(user)
      can :manage, :all
    end

    # ---------------- #
    # - 載入管理員權限 - #
    # ---------------- #

    def load_manager_permissions(user)
      can :manage, :all
    end
end
