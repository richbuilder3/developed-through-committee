class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create!(project_params)

		if @project.save
			redirect_to projects_path
		else
			render new_project_path
		end

	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])

	end

	def update
		project = Project.find(params[:id])
		project.title = params[:title]
		project.email = params[:email]
		project.description = params[:description]
		project.save

	# redirect_to project_path(project)
	end

	def destroy
		Project.delete(params[:id])
		redirect_to '/projects'
	end

	private

		def project_params
			params.require(:project).permit(:title, :email, :description)
		end

end