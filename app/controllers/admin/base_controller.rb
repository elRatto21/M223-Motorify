class Admin::BaseController < ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
    end
end
