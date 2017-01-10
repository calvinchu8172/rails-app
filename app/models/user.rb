class User < ApplicationRecord
  include UserProfileable

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :invitable, :lockable

  # 使用者登入紀錄
  def after_database_authentication
    Log.write(self, self, 'user_sign_in')
  end
end
