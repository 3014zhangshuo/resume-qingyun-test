class Account::UsersController < ApplicationController
  def index
  end

  def user_orders
    @orders = current_user.orders
  end

end
