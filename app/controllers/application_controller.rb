class ApplicationController < ActionController::Base
	protect_from_forgery

	# handle exceptions from can-can.
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = exception.message
		redirect_to root_url
	end

	# helper action from devise that support custom redirection.
	# on first log-in redirecting to edit account.
	def after_sign_in_path_for(resource)
		if current_user.sign_in_count == 1
			edit_user_registration_path 
		else
			stored_location_for(resource) || root_path 
		end
	end


end
