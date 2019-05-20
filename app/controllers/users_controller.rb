class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    user = User.new(user_params)
    user.save
    flash[:message] = "Welcome, #{user.username}!"
    redirect_to songs_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
