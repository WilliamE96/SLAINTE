Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  # User routes
  resources :users, only: [:show]

  # Post routes
  resources :posts, only: [:index, :create, :new, :destroy]
  resources :posts do
    resources :likes, only: [:create, :new, :destroy]
    resources :comments, only: [:create, :new]
    post 'join', on: :member
  end
  # Match routes
  resources :matches do
    member do
      patch :accept
      patch :reject
    end
  end
  # Chatrooms routes
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
