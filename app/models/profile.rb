class Profile < ActiveRecord::Base

  strip_attributes

  enum role: { admin: 0, manager: 1, super_admin: 99 }

  belongs_to :user

  validates :role, presence: true

end
