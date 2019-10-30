class Admin::UsersController < ApplicationController
  before_action :find_param, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, except: [:new]
  def must_be_admin
    unless current_user.try(:admin?)
      redirect_to root_path, notice:"To go to this page, you must sign in as an admin"
    end
  end
  def new
    @user = User.new
  end

  def index
    @users = User.all
    @tasks=Task.all.page(params[:page])
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id]= @user.id
        format.html { redirect_to admin_users_path(@user.id), notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    unless logged_in? && current_user.id == @user.id
      redirect_to root_path, notice: "To see the user profile, You must first login."
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
