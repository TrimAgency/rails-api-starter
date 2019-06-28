Rails.application.routes.draw do
  if ENV["SWAGGER_DOCUMENTATION"].present?
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine => '/api-docs'
  end

  resources :consumers, only: [:update]
  resource  :password_reset, only: [:create], controller: :password_reset
  resources :users, only: [:create, :update, :show, :index]
  resource  :user_token, only: [:create], controller: :user_token
end
