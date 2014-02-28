class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :reset_password_token, :name, :type)
  end
  private :resource_params
end