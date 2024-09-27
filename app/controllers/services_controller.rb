class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.where(team_id: current_user.team_id)
  end

  def new
    @service = Service.new
    @parts = Part.where(team_id: current_user.team_id)
  end

  def show
    @service = Service.find(params[:id])
    @parts = @service.parts
  end

  def create
    @service = Service.new(service_params)
    @service.team_id = current_user.team_id
    
    if @service.save
      redirect_to services_path, notice: "Service created successfully."
    else
      render :new
    end
  end
  
  def edit
    @parts = Part.where(team_id: current_user.team_id)
  end

  def update
    if @service.update(service_params)
      redirect_to services_path, notice: "Service updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path, notice: "Service deleted successfully."
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :date, :mileage, :bike_id, part_ids: [])
  end
end
