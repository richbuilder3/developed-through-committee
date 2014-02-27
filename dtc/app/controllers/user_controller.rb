class UsersController < ApplicationController


	def index
		redirect_to '/index'
	end


	def new

	end

	def create

	# redirect_to 
	end

	end

private

		def user_params
			params.require(:user).permit(:email, :name, :type,)
		end

end