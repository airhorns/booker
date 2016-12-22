Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords',
    confirmations: 'admin_users/confirmations',
    unlocks: 'admin_users/unlocks'
  }
  scope :broker do
    root to: 'broker/brokerages#show', as: 'brokerage'

    devise_for :'broker/users', path: 'auth', controllers: {
      sessions: 'broker/users/sessions',
      confirmations: 'broker/users/confirmations',
      passwords: 'broker/users/passwords',
      unlocks: 'broker/users/unlocks',
      invitations: 'broker/users/invitations'
    }

    resources :users, controller: 'broker/users', as: 'broker_users', only: %i(index edit update destroy)
    resources :listings
  end

  if Rails.env.development?
    devise_scope :admin_user do
      get 'dev_auth', to: 'admin_users/sessions#dev_auth'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
