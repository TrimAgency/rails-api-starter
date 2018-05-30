Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  resources :users, only: [:create, :update, :show, :index]
  resources :consumers, only: [:update]
  resource  :password_reset, only: [:create], controller: :password_reset
end
