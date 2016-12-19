class Profile < ActiveRecord::Base

  strip_attributes

  enum role: { user: 0, super_admin: 99 }

  belongs_to :user

  validates :role, presence: true

end
