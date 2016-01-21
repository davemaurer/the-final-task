class Api::V1::TasksController < ApplicationController
  respond_to :json

  def update
    task = Task.find(params[:id])
    respond_with task.update(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:title, :notes, :complete)
  end
end
