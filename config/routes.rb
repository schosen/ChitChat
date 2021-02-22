Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :room_messages
  resources :rooms

  root controller: :rooms, action: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
