class Employer < User
	
	has_many :projects

	
	#saves in database and emails to to admin and 
	def create_project!(project_params)
		@project = Project.create(project_params)
		self.projects << @project
		EmployerMailer.welcome_email(self).deliver
		return @project
	end

	def delete_project!(employer, project)
		@project = Project.destroy(project_params)
	end

end