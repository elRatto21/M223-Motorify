class Admin::BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
    authorized @bike
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bikes_path, notice: "Bike created successfully."
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:manufacturer, :model, :horsepower, :weight, :year, :mileage, :team_id)
  end
end
