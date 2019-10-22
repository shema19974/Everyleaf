class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @search = Task.ransack(params[:q])
    if params[:q]
      @tasks = @search.result.page(params[:page])
    elsif params[:sort_with_priority]
      @tasks = Task.order('priority DESC').page(params[:page])
    elsif params[:sort_with_ended_at]
      @tasks = Task.order('end_date DESC').page(params[:page])
    else params[:sort_with_created_at]
      @tasks = Task.order('created_at DESC').page(params[:page])
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
    @task = Task.find(params[:id])
    end

    def task_params
    params.require(:task).permit(:title, :content, :start_date, :end_date, :status,:priority, :user_id)
    end
end
