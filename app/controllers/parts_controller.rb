class PartsController < ApplicationController
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

  private

  def part_params
    params.require(:part).permit(:title, :description, :price, :date, :bike_id)
  end
end
