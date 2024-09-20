class ApplicationController < ActionController::Base    
    def check_is_admin
      if current_user.is_admin
        return true
      else
        redirect_to students_path, notice: "You must sign in to access the page"
      end
    end
  
    private
  
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      students_path
    end
 end
  