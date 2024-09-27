class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @members = User.where(team_id: params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path, notice: "Team created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      flash[:notice] = "User updated successfully"
      redirect_to admin_teams_path
    else
      flash.now[:alert] = "There was a problem updating the user"
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:notice] = "Team deleted successfully"
    else
      flash[:alert] = "There was a problem deleting the team"
    end
    redirect_to admin_teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
