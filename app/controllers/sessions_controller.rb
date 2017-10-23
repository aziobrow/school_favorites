class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by[name: params[:session][:name]]
    redirect_to user_path(user)
  end
end
