class UsersController < ApplicationController


	def index
		redirect_to '/index'
	end



private

		def user_params
			params.require(:user).permit(:email, :name, :type,)
		end

end