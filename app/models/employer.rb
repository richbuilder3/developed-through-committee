class Employer < User
	
	has_many :projects

	# trying to save mail in database
	# def save_mail(contact)
	# 	@contact = Contact.new(contact)
	# end

	def create_project!(project_params)
		@project = Project.create(project_params)
		self.projects << @project
		EmployerMailer.welcome_email(self).deliver
		return @project
	end

	def delete_project!(employer, project)
		@project = Project.destroy(project)
	end



end