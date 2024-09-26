class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update]

  def index
    @bikes = Bike.where(team_id: current_user.team_id)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.team_id = current_user.team_id
    if @bike.save
      redirect_to bikes_path, notice: "Bike created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      flash[:notice] = "Bike updated successfully"
      redirect_to bikes_path
    else
      flash.now[:alert] = "There was a problem updating the bike"
      render :edit
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:manufacturer, :model, :horsepower, :weight, :year, :mileage)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
