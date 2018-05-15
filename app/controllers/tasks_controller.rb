class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @show = params[:id]
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @create = Task.new(task_params)
    @create.save

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:task).permit(:title, :details, :completed)
  end
end
