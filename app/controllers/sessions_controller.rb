class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_users_path, notice:"You are logged in as a user"
      else
      redirect_to tasks_path
      end
    else
      flash[:danger] = 'Failed to login'
      render 'new'
    end
  end  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
