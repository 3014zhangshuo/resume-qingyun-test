class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :confirmed_to_current_user_resumes
  #before_action :inspect_user_is_confrim

  #验证用户是否通过验证
  def edit
    @user = current_user
    @resume = Resume.find(params[:resume_id])
  end

  def confirm
    @resume = Resume.find(params[:resume_id])
    @user = current_user
    @user.update(user_params)
    @user.save
    if @user.user_code == @user.confirm_code
      @user.is_confirmed = true
      @user.save!
      flash.keep[:notice] = "验证成功!"
      redirect_to user_resume_editor_path(@resume)
    else
      flash[:warning] = "请输入正确的验证码"
      redirect_to edit_user_path(current_user,:resume_id => @resume.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:confirm_code)
  end

end
