Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'friendship', to: 'friendships#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  get 'friend_request/:id', to: 'users#friend_request', as: 'new_request'
  post 'accept_friend_request/:id', to: 'users#accept_friend_request', as: 'accept_request'
  post 'delete_friend_request/:id', to: 'users#delete_friend_request', as: 'delete_request'
  # Defines the root path route ("/")
  # root "articles#index"
end
