class PagesController < ApplicationController
    def index
        if current_user.team_id.present?
            @team_name = Team.find_by(id: current_user.team_id)&.name
        else
            @team_name = "No team assigned"
        end
    end
end
