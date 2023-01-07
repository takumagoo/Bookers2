class ApplicationController < ActionController::Base
  # protect_from_forgery
  # before_action :authenticate_user!, except: [:sign_in]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sign_in後のpath
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    # flash[:notice] = "Login OK"
  end
  # log_out後のpath
  def after_sign_out_path_for(resource)
    root_path
    # flash[:notice] = "You have created user successfully."
  end

  # #log_in後のpath
  # def after_log_in_path_for(resource)
  #   users_path
  # end


  protected

  # devise版のストロングパラメータ
  def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      # devise_parameter_sanitizer.permit(:log_in, keys: [:name])
  end

end
