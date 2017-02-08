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

  def pay
    @order = Order.find_by_token(params[:id])
    #@resume = @order.resume
  end

  def pay_submit
    @order = Order.find_by_token(params[:id])
    @resume = @order.resume
    @order.update(order_params)
    @order.save!
    if @order.pay_code == @order.paid_code
      @order.is_paid = true
      @order.save!
      flash.keep[:notice] = "验证成功!欢迎使用"
      redirect_to user_resume_editor_path(@resume)
    else
      flash[:warning] = "请输入正确的验证码"
      redirect_to :back
    end
  end

  private

  def order_params
    params.require(:order).premit(:plan, :plan_amount, :money, :paymethod,:paid_code)
  end

end
