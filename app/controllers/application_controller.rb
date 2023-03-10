class ApplicationController < ActionController::Base


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_up_path_for(resource_or_scope)
    root_path
  end
  
end
