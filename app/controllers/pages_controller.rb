class PagesController < ApplicationController
    def index
        @team_name = Team.find(current_user.team_id).name
    end
end
