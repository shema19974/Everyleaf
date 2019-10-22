class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private
  def first_login!
    if !logged_in?
      redirect_to new_session_path, notice: "You have to login first"
    end
  end
end
