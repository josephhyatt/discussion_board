# hooks into devise. kind of a child of devise that depends on registrations controller in devise.
class RegistrationsController < Devise::RegistrationController 

  private
  # part of devise 
  # allowing a new parameter to be passed when user signs up for account
  # wont let anything you dont declare as permittable through the pipes 
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end 
  # part of devise
  # wont let anything you dont declare as permittable through the pipes
  def account_update_params 
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end