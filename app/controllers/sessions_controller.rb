class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif params[:session]
      user = User.find_by(name: params[:session][:name])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      end
    else
      flash[:error] = "Username or password does not exist. Please sign up for an account."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
