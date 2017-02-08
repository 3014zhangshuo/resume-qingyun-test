class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @resume = current_user.resumes.find(:resume_id)
    @order.user = @user
    @order.resume = @resume
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to :back
      flash[:notice] = "订单创建成功请支付"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).premit(:plan, :plan_amount, :money, :paymethod)
  end
  
end
