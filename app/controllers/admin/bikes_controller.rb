class Admin::BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to admin_bikes_path, notice: "Bike created successfully."
    else
      flash[:alert] = @bike.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @bike.destroy
    redirect_to admin_bikes_path, notice: "Bike deleted successfully."
  end

  private

  def bike_params
    params.require(:bike).permit(:manufacturer, :model, :horsepower, :weight, :year, :mileage, :team_id)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
