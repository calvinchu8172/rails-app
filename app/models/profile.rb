class Profile < ActiveRecord::Base

  strip_attributes

  enum role: { user: 0, admin: 1, super_admin: 99 }

  default_value_for :role, 'user'

  belongs_to :user

  validates :role, presence: true

  scope :not_super_admin, -> {
    where.not(role: 'super_admin')
  }

  class << self

    # 多國語言化的 role select options
    def role_select_options
      self.roles.keys.reject{ |role|
        role == 'super_admin'
      }.map do |role|
        [Profile.human_attribute_name("role.#{role}"), role]
      end
    end
  end
end
