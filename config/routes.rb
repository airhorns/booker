Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :admin_users

  scope :broker do
    root to: 'broker/brokerages#show', as: 'brokerage'

    devise_for :'broker/users', path: 'auth', controllers: {
      sessions: 'broker/users/sessions',
      passwords: 'broker/users/passwords',
      registrations: 'broker/users/registrations',
      unlocks: 'broker/users/unlocks'
    }

    resources :users, controller: 'broker/users', as: 'broker_users'
    resources :listings
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
