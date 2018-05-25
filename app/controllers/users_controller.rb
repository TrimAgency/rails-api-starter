class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    registration = UserRegistrationForm.new(user_params)
    registration.save!

    render json: {
        user: UserSerializer.new(registration.user).attributes,
        token: registration.user.generate_token
    }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :profile_type,
                                 profile: [:first_name,
                                           :last_name])
  end
end