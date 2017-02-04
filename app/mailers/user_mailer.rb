class UserMailer < ApplicationMailer
  def notify_user_confirm(user)
    @user = user
    @user_code = @user.user_code
    mail(to: @user.email , subject: "[ResumeHack] 感谢您成为本站会员，下面是确认码")
  end
end
