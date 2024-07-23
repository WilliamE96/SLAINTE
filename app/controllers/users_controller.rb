class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation, :profile_picture)
  end
end
