class BikesController < ApplicationController
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

  private

  def bike_params
    params.require(:bike).permit(:manufacturer, :model, :horsepower, :weight, :year, :mileage)
  end
end
