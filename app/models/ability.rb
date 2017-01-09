class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      send("load_#{user.profile.role}_permissions", user)
    end
  end

  private

    # -------------------- #
    # - 載入一般使用者權限 - #
    # -------------------- #

    def load_user_permissions(user)
    end

    # ---------------- #
    # - 載入管理員權限 - #
    # ---------------- #

    def load_admin_permissions(user)

      # -------------- #
      # - 人員帳號管理 - #
      # -------------- #
      # 列表, 查看
      can :read, User, { profile: { role: [0, 1] } }
      # 邀請會員
      can :invite, User
      # 重寄邀請信
      can :resent_invitation, User do |u|
        !u.invitation_accepted?
      end
      # 編輯 (非自己會員)
      can :update, User do |u|
        u != user
      end
      # 鎖定 (非自己會員)
      can :lock, User do |u|
        !u.access_locked? && u != user
      end
      # 解鎖 (非自己會員)
      can :unlock, User do |u|
        u.access_locked? && u != user
      end
      # 重寄邀請信
      can :resent_invitation, User do |u|
        !u.invitation_accepted?
      end
    end

    # -------------------- #
    # - 載入超級管理員權限 - #
    # -------------------- #

    def load_super_admin_permissions(user)

      # -------------- #
      # - 人員帳號管理 - #
      # -------------- #
      # 列表, 查看
      can :read, User
      # 邀請會員
      can :invite, User
      # 重寄邀請信
      can :resent_invitation, User do |u|
        !u.invitation_accepted?
      end
      # 編輯 (非自己會員)
      can :update, User do |u|
        u != user
      end
      # 鎖定 (非自己會員)
      can :lock, User do |u|
        !u.access_locked? && u != user
      end
      # 解鎖 (非自己會員)
      can :unlock, User do |u|
        u.access_locked? && u != user
      end
      # 重寄邀請信
      can :resent_invitation, User do |u|
        !u.invitation_accepted?
      end
    end
end
