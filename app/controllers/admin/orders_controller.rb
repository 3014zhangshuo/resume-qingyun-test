class Admin::OrdersController < ApplicationController

  def index
    @orders = User.find(params[:id]).orders
  end

  def send_code
    @order = Order.find(params[:id])
    @user = @order.user
    @resume = @order.resume
    OrderMailer.notify_user_confirm(@order,@user,@resume).deliver!
    redirect_to :back
  end

end
