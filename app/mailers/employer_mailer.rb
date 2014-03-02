class EmployerMailer < ActionMailer::Base
  default from: "richard.c.grundy@gmail.com"

	def welcome_email(user)
		@employer = user
		@projects = @employer.projects
		mail(to: @employer.email, subject: "Thanks for your request, We'll get in touch with you shortly")
	end

end
