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
        format.html { redirect_to tasks_path, notice: 'User was successfully created.' }
      else
        render 'new'
      end
    end
  end
  def destroy
    if @user.tasks.present?
      @task=Task.where(user_id: @user.id)
      @task.destroy_all
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
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
