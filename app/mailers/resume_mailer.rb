class ResumeMailer < ApplicationMailer
  def notify_user_edit_one(user,resume)
    #binding.pry
    @resume = resume
    @user = user
    mail(to: @user.email , subject: "[ResumeHack] 导师第一次修改完成！")
  end

end
