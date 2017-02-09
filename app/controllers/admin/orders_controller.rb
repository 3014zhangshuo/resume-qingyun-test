class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :inspect_user_is_confrim #验证用户是否通过验证
  layout "admin"
  
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

  def destroy
    @order = Order.destroy(params[:id])
    redirect_to :back
  end

end
