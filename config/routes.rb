Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  # User routes
  resources :users, only: [:show] do
    collection do
      get 'map'
      get 'locations'
    end
  end

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
      delete :cancel # this line is to handle match cancellation
    end
  end

  # Chat routes
  get "friends", to: "pages#friends"
  get "chats", to: "pages#chats"
  resources :matches, only: :show do
    resources :messages, only: :create
  end
end
