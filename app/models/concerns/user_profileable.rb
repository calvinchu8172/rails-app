module UserProfileable
  extend ActiveSupport::Concern

  included do

    has_one :profile, dependent: :destroy

    accepts_nested_attributes_for :profile

    scope :super_admins, -> {
      joins(:profile).merge(Profile.super_admin)
    }

    def super_admin!
      self.create_profile unless self.profile
      self.profile.super_admin!
    end
  end

  class_methods do
  end
end
