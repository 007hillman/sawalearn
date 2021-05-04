class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :update_allowed_parameters, if: :devise_controller?

@@subject = nil

	def current_subject
		if params[:sub_id]
			session[:sub_id_s] = params[:sub_id]
		end
		Subject.find(session[:sub_id_s])
	end

helper_method :current_subject
	protected 
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password,:password_confirmation,:gender, :region, :school, :date_of_birth)}
    devise_parameter_sanitizer.permit(:account_update) { |u|    
    			u.permit(:name, :surname, :email, :password,:password_confirmation,:gender, :region, :school, :date_of_birth)}
  end
end
