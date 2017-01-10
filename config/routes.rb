Rails.application.routes.draw do

  root 'admin/dashboard#index'

  devise_for :users,
    controllers: {
      passwords:   'users/passwords',
      sessions:    'users/sessions',
      invitations: 'users/creations'
    },
    path_names: {
      invitation: 'creation'
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
    put  'admin/users',      to: 'users/registrations#update', as: 'user_registration'
    # 新增人員
    get  'admin/users/creation/new', to: 'users/creations#new',    as: 'admin_users_creation_new'
    post 'admin/users/creation',     to: 'users/creations#create', as: 'admin_users_creation'
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        # 重寄新增認證信
        get    'creation/resend', to: 'users#resend_creation'
        # 鎖定與解鎖帳號
        delete 'lock',   to: 'users#lock'
        put    'unlock', to: 'users#unlock'
      end
    end
  end
end
