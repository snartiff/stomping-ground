class RegistrationsController < Devise::RegistrationsController

  # def update
  #   @user = User.update_attributes(account_update_params)
  #   if @user.save?
  #     redirect_to user_path(@user)
  #   else
  #     render :update
  #   end
  # end

  private

  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation, :current_password, :avatar)
  end
end
