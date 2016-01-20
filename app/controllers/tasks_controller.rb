class TasksController < ApplicationController
  attr_reader :list, :tag

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    task = list.tasks.new(task_params)
    if task.save
      flash[:notice] = "Task #{task.title} created"
      redirect_to lists_path
    else
      flash[:notice] = "Please try again"
      redirect_to lists_path
    end
  end

  def edit

  end

  def update

  end

  private
  def list
    @list ||= List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:list_id, :title, :status, :notes, :start_date, :due_date)
  end
end
