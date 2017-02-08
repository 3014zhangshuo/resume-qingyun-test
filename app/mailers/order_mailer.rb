class OrderMailer < ApplicationMailer

  def notify_admin_send_paid_code(user,resume,order)
    @resume = resume
    @user = user
    @order = order
    @admin = "resumehack2016@gmail.com"
    mail(to: @admin , subject: "[ResumeHack] 购买成功请发送购买码")
  end

end
