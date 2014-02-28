class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
  private :resource_params
end

# added to include name and type in database