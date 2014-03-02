class Developer < User

	has_many :profiles

	def create_profile!(developer, profile)
		@profile = Profile.create(profile)
	end

	def delete_profile!(developer, profile)
		@profile = Profile.destroy(profile)
	end

	# def show
	# 	@developer = Developer.find(params[:id])
	# 	@profiles = @developer.profiles.
	# end

end