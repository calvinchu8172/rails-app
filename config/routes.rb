Rails.application.routes.draw do

  root 'admin/dashboard#index'

  devise_for :users,
    controllers: {
      passwords:   'users/passwords',
      sessions:    'users/sessions',
      invitations: 'users/invitations'
    },
    skip: [:registrations, :confirmations]

  devise_scope :user do
    # 超級管理員註冊
    get  'super_admin/sign_up', to: 'super_admin/registrations#new'
    post 'super_admin/sign_up', to: 'super_admin/registrations#create'
    # 重發超級管理員認證信
    get  'super_admin/confirmation/resend', to: 'super_admin/confirmations#new'
    get  'super_admin/confirmation',        to: 'super_admin/confirmations#show'
    post 'super_admin/confirmation',        to: 'super_admin/confirmations#create'
  end

end
