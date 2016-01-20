class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def new
  end

  def create
    @list = current_user.lists.where(list_params).first_or_create
    if current_user && @list.save
      flash[:notice] = "List created!"
      redirect_to lists_path
    else
      flash.now[:notice] = "Please try again"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      flash[:notice] = "List Updated Successfully"
      redirect_to lists_path
    else
      flash.now[:notice] = "Please try again"
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "Your list has been deleted."
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end
end
