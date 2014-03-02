class ProfilesController < ApplicationController
	#before_filter :signed_in_developer
		# above for signed in developer

	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
	end

	def create
		@developer = current_user
		@profile = @developer.create_profile!(@developer, profile_params)
		if @profile.save
			@developer.profiles << @profile
			redirect_to root_path(@current_user)
		else
			render new_profile_path
		end
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	# def update
	# 	profile = Project.find(params[:id])
	# 	profile.name


	private

	def profile_params
		params.require(:profile).permit(:name, :email, :story, :work)
	end


end

