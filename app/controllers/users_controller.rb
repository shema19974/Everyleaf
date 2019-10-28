class UsersController < ApplicationController
  before_action :find_param, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save 
        session[:user_id]= @user.id
        if @user.admin?
            format.html { redirect_to admin_users_url, notice: 'User was successfully created'}
          elsif !@user.admin?
            format.html { redirect_to tasks_path, notice: 'User was successfully created.' }
          else
            render 'new'
        end
      end
    end
  end
  def destroy
    if @user.id == current_user.id
      redirect_to admin_users_url, notice: "You are not allowed to delete a signed user"
      @admin = User.count_admins
    elsif @admin == 1
      redirect_to admin_users_url, notice: "At least one admin must remain!"
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:admin)
  end
  def find_param
    @user = User.find(params[:id])
  end

end
