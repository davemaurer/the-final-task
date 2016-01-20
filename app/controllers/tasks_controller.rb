class TasksController < ApplicationController
  attr_reader :list

  def index
  end

  def new
    @list = List.find(params[:id])
    @task = Task.new
  end

  def create
    task = list.tasks.new(task_params)
    if task.save
      flash[:notice] = "Task #{task.title} created"
      redirect_to list_path(list)
    else
      flash[:notice] = "Please try again"
      redirect_to list_path(list)
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash[:notice] = "Task Updated Successfully"
      redirect_to list_path(list)
    else
      flash[:notice] = "Please try again"
      redirect_to list_path(list)
    end
  end

  private
  def list
    @list ||= List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:list_id, :title, :status, :notes, :start_date, :due_date)
  end
end
