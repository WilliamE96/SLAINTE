Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # # User routes
  resources :users, only: [:new, :create, :show, :edit, :update]

  # Post routes
  resources :posts, only: [:index, :create, :new, :destroy]
  resources :posts do
    resources :likes, only: [:create, :new, :destroy]
    resources :comments, only: [:create]
    post 'join', on: :member
  end
  # Match routes
  resources :matches, only: [:index, :create, :update, :destroy]
end
