Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :users, only: [ :show, :update ] do
    resources :requests, only: [ :create ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
