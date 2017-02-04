class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :confirmed_to_current_user_resumes
  before_action :inspect_user_is_confrim
  #验证用户是否通过验证
  def edit
    @user = current_user
    @resume = Resume.find(params[:resume_id])
    if @user.confirm?
      redirect_to user_resume_editor_path(@resume)
    end
    #binding.pry
  end

  def confirm
    @resume = Resume.find(params[:resume_id])
    @user = current_user
    @user.update(user_params)
    @user.save
    if @user.confirm?
      redirect_to user_resume_editor_path(@resume)
    else
      redirect_to edit_user_path(current_user,:resume_id => @resume.id)
      flash[:warning] = "请输入正确的验证码"
    end
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
