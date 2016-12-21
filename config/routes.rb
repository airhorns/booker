Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :brokerage_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope :brokerage do
    root to: 'brokerages#show'

    resources :users, controller: 'brokerage_users', as: 'brokerage_users'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
