Rails.application.routes.draw do
  devise_for :clients
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    confirmations: 'admin_users/confirmations',
    unlocks: 'admin_users/unlocks'
  }
  scope :broker, module: 'broker' do
    root to: 'brokerages#show', as: 'brokerage'

    devise_for :'broker/users', path: 'auth', controllers: {
      sessions: 'broker/users/sessions',
      confirmations: 'broker/users/confirmations',
      passwords: 'broker/users/passwords',
      unlocks: 'broker/users/unlocks',
      invitations: 'broker/users/invitations'
    }

    resources :users, as: 'broker_users', only: %i(index edit update destroy)
    resources :listings
    resources :admin_masquerades, only: %i(index create)
  end

  if Rails.env.development?
    devise_scope :admin_user do
      get 'dev_auth', to: 'admin_users/sessions#dev_auth'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
