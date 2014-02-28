class Employer < User

	has_many :projects




	def create_project!(employer, project)
		@project = Project.create(project)
	end


	def delete_project!(employer, project)
		@project = Project.destroy(project)
	end
end