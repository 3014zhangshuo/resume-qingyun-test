class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :confirmed_to_current_user_resumes
  before_action :inspect_user_is_confrim
  #验证用户是否通过验证
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_resumes_path
  end

  private

  def user_params
    params.require(:user).permit(:confirm_code)
  end

  # def confirmed_to_current_user_resumes
  #   if @user = User.find(params[:id])
  #     @user.is_confirmed == true
  #     redirect_to root_path
  #     flash[:notice] = "不能进入"
  #   end
  # end

end
