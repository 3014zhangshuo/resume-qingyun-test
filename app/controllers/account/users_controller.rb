class Account::UsersController < ApplicationController
  def index
  end

  def user_order
    @order = current_user.orders
  end
  
end
