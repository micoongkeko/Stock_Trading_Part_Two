class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if resource.admin_role == true
            rails_admin_path
        elsif resource.admin_role == false
            users_path 
        end
    end
end
