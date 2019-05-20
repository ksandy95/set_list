class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      current_user
      redirect_to user_path(user)
    else
      render :new
    end
  end
end
