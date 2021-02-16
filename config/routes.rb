Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  # root to: "home#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
