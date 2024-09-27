class Manage::TeamsController < ApplicationController
  before_action :ensure_teamleader_can_create, only: [:new, :create]
  before_action :set_team, only: [:show, :edit, :update, :destroy, :add_users_to_team]
  before_action :authorize_teamleader_access, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.teamleader?
      @teams = Team.where(id: current_user.team_id) # Show only the teamleader's team
    else
      @teams = Team.all # Admins can see all teams
    end
  end

  def new
    @team = Team.new
  end

  def show
    @members = User.where(team_id: params[:id])
    @users_without_team = User.where(team_id: nil)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_user.update(team_id: @team.id) # Assign teamleader to this team
      redirect_to manage_team_path(@team), notice: "Team created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      flash[:notice] = "Team updated successfully"
      redirect_to manage_team_path(@team)
    else
      flash.now[:alert] = "There was a problem updating the team"
      render :edit
    end
  end

  def destroy
    if @team.destroy
      flash[:notice] = "Team deleted successfully"
    else
      flash[:alert] = "There was a problem deleting the team"
    end
    redirect_to manage_teams_path
  end

  def add_users_to_team
    if current_user.teamleader? && @team.id == current_user.team_id
      # Filter out empty values from the selected user_ids
      user_ids = (params[:user][:user_ids] || []).reject(&:blank?)

      # Assign the team to these users
      if user_ids.any?
        User.where(id: user_ids).update_all(team_id: @team.id)
        flash[:notice] = "Users added to the team successfully."
      else
        flash[:alert] = "No users were selected."
      end
    else
      flash[:alert] = "You are not authorized to add users to this team."
    end
    redirect_to manage_team_path(@team)
  end

  def add_users_to_team
    if current_user.teamleader? && @team.id == current_user.team_id
      # Filter out empty values from the selected user_ids
      user_ids = (params[:user][:user_ids] || []).reject(&:blank?)

      # Assign the team to these users
      if user_ids.any?
        User.where(id: user_ids).update_all(team_id: @team.id)
        flash[:notice] = "Users added to the team successfully."
      else
        flash[:alert] = "No users were selected."
      end
    else
      flash[:alert] = "You are not authorized to add users to this team."
    end
    redirect_to manage_team_path(@team)
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def ensure_teamleader_can_create
    if current_user.team_id.present?
      redirect_to manage_team_path(current_user.team_id), alert: "You are already part of a team and cannot create a new one."
    end
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def authorize_teamleader_access
    if current_user.teamleader? && current_user.team_id != @team.id
      redirect_to manage_teams_path, alert: "You can only manage your own team."
    end
  end
end
