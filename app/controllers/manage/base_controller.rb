class Manage::BaseController < ApplicationController
    before_action :authenticate_manager!

    def authenticate_manager!
    end
end
