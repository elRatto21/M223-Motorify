class Manage::BaseController < ApplicationController
    before_action :authorize_manager
    
    private

    def authorize_manager
        authorize :teamleader, :access?
    end
end
