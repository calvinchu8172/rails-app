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
    # 變更密碼
    get  'admin/users/edit', to: 'users/registrations#edit',   as: 'edit_user_registration'
    put  'admin/users/edit', to: 'users/registrations#update', as: 'user_registration'
    # 邀請會員
    get  'admin/users/invitation/new', to: 'users/invitations#new'
    post 'admin/users/invitation',     to: 'users/invitations#create'
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        # 重寄邀請信
        get    'invitation/resent', to: 'users#resent_invitation'
        # 鎖定與解鎖帳號
        delete 'lock',              to: 'users#lock'
        put    'unlock',            to: 'users#unlock'
      end
    end
  end
end
