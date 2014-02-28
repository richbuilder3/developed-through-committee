class Employer < User

	has_many :projects



	def create_project!
		@project = Project.create_project!(params[:user_id], [:project])
	end

end