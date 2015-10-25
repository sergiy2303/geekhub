class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = 'You entered wrong password or email'
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end

  def chek_authenticate
    return if signed_in?
    redirect_to new_session_path
  end

  private

  def current_user
    User.find(session[:current_user_id])
  end

  def signed_in?
    return true if session[:current_user_id]
  end
end
