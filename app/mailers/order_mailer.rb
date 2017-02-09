class OrderMailer < ApplicationMailer

  def notify_admin_send_paid_code(user,resume,order)
    @resume = resume
    @user = user
    @order = order
    @admin = "resumehack2016@gmail.com"
    mail(to: @admin , subject: "[ResumeHack] 已有订单生成,请确认用户是否付款")
  end

  def notify_user_confirm(order,user,resume)
    @resume = resume
    @user = user
    @order = order
    mail(to: @user.email , subject: "[ResumeHack] 购买成功，感谢您使用我们的服务，下面是确认码")
  end
end
