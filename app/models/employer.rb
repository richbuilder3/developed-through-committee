class Employer < User

	has_many :projects



	def create_project!
		projects.create_project!(user_id: project.id)
	end

end