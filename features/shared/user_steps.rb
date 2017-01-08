Given /^the super admin has already signed up$/ do
  @super_admin_profile = FactoryGirl.create(:super_admin_profile)
  @super_admin = @super_admin_profile.user
end
