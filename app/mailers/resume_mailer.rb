class ResumeMailer < ApplicationMailer

  def notify_master_sumbit_one(user,resume)
    @resume = resume
    @user = user
    @admin = "1@1.com"
    mail(to: @admin , subject: "[ResumeHack] 用户提交第一次修改！")
  end

  def notify_user_edit_one(user,resume)
    #binding.pry
    @resume = resume
    @user = user
    mail(to: @user.email , subject: "[ResumeHack] 导师第一次修改完成！")
  end

  def notify_master_sumbit_two(user,resume)
    @resume = resume
    @user = user
    @admin = "1@1.com"
    mail(to: @admin , subject: "[ResumeHack] 用户提交第二次修改！")
  end

  def notify_user_edit_two(user,resume)
    #binding.pry
    @resume = resume
    @user = user
    mail(to: @user.email , subject: "[ResumeHack] 导师第二次修改完成！")
  end


end
