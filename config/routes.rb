Rails.application.routes.draw do
  if ENV["SWAGGER_DOCUMENTATION"].present?
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine => '/api-docs'
  end

  namespace :api do
    namespace :v1 do
      resources :consumers, only: [:update]
      resource  :password_reset, only: [:create], controller: :password_reset
      resources :users, only: [:create, :update, :show]
      resource  :user_token, only: [:create], controller: :user_token
    end
  end

  resources :passwords, only: [:edit, :update]
end
