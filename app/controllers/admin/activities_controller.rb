class Admin::ActivitiesController < ApplicationController
    before_action :require_admin

  def index
    @versions = PaperTrail::Version.order(created_at: :desc).limit(100)
  end

  private

  def require_admin
    unless current_user&.role == 'admin'
      flash[:alert] = "You are not authorized to access this section"
      redirect_to root_path
    end
  end
end
