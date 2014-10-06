class RegistrationsController < Devise::RegistrationsController

	before_filter :check_permissions, :only => [:new, :create]
	skip_before_filter :require_no_authentication

	def check_permissions
		authorize! :create, resource
	end

	def new
		@roles = Role.all
		super
	end

	def create
		@user = User.new(params[:user])
		@user.password = Devise.friendly_token.first(8)
		if @user.save
			UserMailer.notify_user(@user).deliver
			flash[:notice] = "Successfully created user"
			redirect_to root_path
		else
			@roles = Role.all
			render '/registrations/new'
		end
	end
	

end
