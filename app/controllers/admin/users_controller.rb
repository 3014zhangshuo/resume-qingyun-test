class Admin::UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :admin_required
 layout "admin"
 def index
   @users = User.all
 end

 def admin_state
   @user = User.find(params[:id])
   @user.admin!
   redirect_to :back
 end

 def user_state
   @user = User.find(params[:id])
   @user.user!
   redirect_to :back
 end

end
