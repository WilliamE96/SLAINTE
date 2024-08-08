class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  has_many :matches
  has_many :matched_users, through: :matches, source: :matched_user

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    @user = User.find(params[:id])
    params.require(:user).permit(:username, :password, :email, :password_confirmation, :photo)
  end
end
