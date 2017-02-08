class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @resume = Resume.find(params[:id])
  end

  def choice_submit
    @order = Order.new(order_params)
    @order.user = current_user
    @order.resume = Resume.find(params[:id])
    @order.pay_code = SecureRandom.hex
    if @order.save!
      redirect_to pay_order_path(@order.token)
      flash[:notice] = "订单创建成功请支付"
    else
      render :new
    end
  end

  def pay
    @order = Order.find_by_token(params[:id])
  end

  def pay_submit
    @order = Order.find_by_token(params[:id])
    @resume = @order.resume
    @order.update(order_params)
    @order.save!
    if @order.pay_code == @order.paid_code
      @order.is_paid = true
      @order.order_paid!
      @resume.is_paid = true
      @order.save!
      flash.keep[:notice] = "验证成功!欢迎使用"
      redirect_to user_resume_editor_path(@resume)
    else
      flash[:warning] = "请输入正确的验证码"
      redirect_to pay_order_path(@order.token)
    end
  end

  private

  def order_params
    params.require(:order).permit(:plan, :plan_amount, :money, :paymethod,:paid_code)
  end

end
