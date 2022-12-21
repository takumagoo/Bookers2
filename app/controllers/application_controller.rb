class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sign_in後のpath
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  # log_out後のpath
  def after_sign_out_path_for(resource)
    root_path
  end

  # #log_in後のpath
  # def after_log_in_path_for(resource)
  #   users_path
  # end


  protected

  # devise版のストロングパラメータ
  def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # devise_parameter_sanitizer.permit(:log_in, keys: [:name])
  end

end
