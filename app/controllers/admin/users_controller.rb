class Admin::UsersController < Admin::BaseController

  def index
    @default_users = User.where(role: "default")
    @admin_users = User.where(role: "admin")
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "User #{user.name} successfully deleted"
    redirect_to admin_users_path
  end

end
