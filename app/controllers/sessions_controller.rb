class SessionsController < ApplicationController

  def new
    if !current_user
      @user = User.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "Your login credentials were incorrect. Please try again."
        render :new
      end
    end
  end

  def destroy 
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end