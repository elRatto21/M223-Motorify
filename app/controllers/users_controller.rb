class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = current_user
    authorize @user
  end

  def new
    @user = User.new
    authorize User
  end

  def create
    @user = User.new(user_params)
    authorize User

    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to login_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
