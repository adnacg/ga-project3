class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.class.name == "Patron"
            current_patron
        elsif resource.classe.name == "User"
            user_tables_url(user)
        end
    end
end
