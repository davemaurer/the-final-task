class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful. Welcome Back."
      redirect_to tasks_path
    else
      flash[:notice] = "Invalid login. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Thanks for Tasking...You are now logged out."
    redirect_to root_path
  end
end
