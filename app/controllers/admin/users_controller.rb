class Admin::UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :admin_required
 before_action :inspect_user_is_confrim #验证用户是否通过验证
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

 def sent_confirm_email
   @user = User.find(params[:id])
   UserMailer.notify_user_confirm(@user).deliver!
   redirect_to admin_users_path
 end

end
