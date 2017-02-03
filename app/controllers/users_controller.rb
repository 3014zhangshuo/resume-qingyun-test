class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:confirm_code)
  end

end
