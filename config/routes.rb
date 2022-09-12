Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users
  resources :profiles
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  get 'friend_request/:id', to: 'friend_requests#friend_request', as: 'new_request'
  post 'accept_friend_request/:id', to: 'friend_requests#accept_friend_request', as: 'accept_request'
  post 'delete_friend_request/:id', to: 'friend_requests#delete_friend_request', as: 'delete_request'
  get 'friendship', to: 'friendships#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
