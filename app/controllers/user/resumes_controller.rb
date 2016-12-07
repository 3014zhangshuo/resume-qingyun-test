class User::ResumesController < ApplicationController

  def index
    @resumes = Resume.all    
  end


  def new
    @resume = Resume.new 
  end

  def create
    @resume = Resume.new(question_params)
    @resume.save
    redirect_to 
  end



  private
  # 50列参数
  def question_params
    params.require(:resume).permit(
      :answer00,:answer01,:answer02,:answer03,:answer04,:answer05,:answer06,:answer07,:answer08,:answer09,
      :answer10,:answer11,:answer12,:answer13,:answer14,:answer15,:answer16,:answer17,:answer18,:answer19,
      :answer20,:answer21,:answer22,:answer23,:answer24,:answer25,:answer26,:answer27,:answer28,:answer29
      :answer30,:answer31,:answer32,:answer33,:answer34,:answer35,:answer36,:answer37,:answer38,:answer39
      :answer40,:answer41,:answer42,:answer43,:answer44,:answer45,:answer46,:answer47,:answer48,:answer49)
  end

end
