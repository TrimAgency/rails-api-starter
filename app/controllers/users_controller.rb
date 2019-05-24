class UsersController < ApplicationController
  USER_ROOT= 'user'.freeze
  load_and_authorize_resource except: :create
  skip_before_action :authenticate_user, only: :create

  def show
    render json: UserSerializer.render(@user, root: USER_ROOT), 
           status: :ok
  end

  def create
    registration = UserRegistrationForm.new(create_params)
    registration.save!
    @user = registration.user

    render_created_user
  end

  def update
    @user.update!(update_params)

    render json: UserSerializer.render(@user, root: USER_ROOT, view: :update), 
           status: :ok
  end

  private

  def create_params
    params.permit(:email,
                  :password,
                  :password_confirmation,
                  :profile_type,
                  profile: [:first_name,
                            :last_name])
  end

  def update_params
    params.permit(:email, :password, :password_confirmation)
  end

  def render_created_user
    render json: UserSerializer.render(
      @user, 
      root: USER_ROOT, 
      view: :create, 
      token: @user.generate_token
    ), status: :created
  end
end