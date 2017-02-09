class Account::UsersController < ApplicationController
  def index
  end

  def user_orders
    @orders = current_user.orders
  end

  def change_password_submit
    @user = current_user
    @user.update_attributes(:password, :password_confirmation)
    @user.save
  end

end
