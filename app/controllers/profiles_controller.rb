class ProfilesController < ApplicationController
	# before_filter :signed_in_developer

	def index
		@profiles = Profile.all

		respond_to do |format|
			format.html
			format.json { render json: @profiles }
		end
	end

	def new
		@profile = Profile.new
	end

	def create
		@developer = current_user
		@profile = @developer.create_profile!(@developer, profile_params)
		@profile.save

		respond_to do |format|
			format.html { redirect_to root_path(@current_user)}
			format.json { render json: @profile }
		end
	end
	
	def show
		@profile = Profile.find(params[:id])
	end

	def edit
		@profile = Profile.find(params[:id])
	end



	private

	def profile_params
		params.require(:profile).permit(:name, :email, :story, :work)
	end
end

