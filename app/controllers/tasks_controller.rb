class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end
end
