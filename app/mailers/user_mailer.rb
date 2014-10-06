class UserMailer < ActionMailer::Base
	default from: "from@no-reply.com"

	def notify_user(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to GroupOfis')
	end
end
