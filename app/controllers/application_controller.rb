class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.class.name == "Patron"
            # current_patron
            patron_favourites_url(current_patron)
        elsif resource.class.name == "User"
            user_tables_url(current_user)
        end
    end
end
