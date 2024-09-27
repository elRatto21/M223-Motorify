class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def index
    @parts = Part.where(team_id: current_user.team_id)
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    @part.team_id = current_user.team_id
    if @part.save
      redirect_to parts_path, notice: "Part created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to parts_path, notice: "Part updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_path, notice: "Part deleted successfully."
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:title, :description, :price, :date, :bike_id)
  end
end
