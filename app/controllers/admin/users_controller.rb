class Admin::UsersController < ApplicationController
    before_action :require_admin
    before_action :set_user, only: [:edit, :update]

    def index
        @users = User.all
    end

    def destroy
        @user = User.find(params[:id]) # Ensure the correct user is being found
        if @user.destroy
          flash[:notice] = "User deleted successfully"
        else
          flash[:alert] = "There was a problem deleting the user"
        end
        redirect_to admin_users_path
      end
      

    def edit
      @teams = Team.all # Assuming you have a Team model
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "User updated successfully"
        redirect_to admin_users_path
      else
        flash.now[:alert] = "There was a problem updating the user"
        render :edit
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :team_id, :role)
    end

    def require_admin
      unless current_user&.role == 'admin'
        flash[:alert] = "You are not authorized to access this section"
        redirect_to root_path
      end
    end
end
