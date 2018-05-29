class UsersController < ApplicationController
  load_and_authorize_resource except: :create
  skip_before_action :authenticate_user, only: :create

  def show
    render json: {
        user: UserSerializer.new(@user)
    }, status: :ok
  end

  def create
    registration = UserRegistrationForm.new(create_params)
    registration.save!

    render json: {
        user: UserSerializer.new(registration.user),
        token: registration.user.generate_token
    }, status: :created
  end

  def update
    @user.update!(update_params)

    render json: {
        user: UserSerializer.new(@user)
    }, status: :ok
  end

  private

  def create_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :profile_type,
                                 profile: [:first_name,
                                           :last_name])
  end

  def update_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end
end