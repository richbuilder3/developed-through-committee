class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def create
		@title = params[:title]
		@email = params[:email]
		@description = params[:description]

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

end