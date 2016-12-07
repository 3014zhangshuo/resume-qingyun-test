class User::ResumesController < ApplicationController
  layout "pdf", only: [:download]

  def index
    @resumes = Resume.all
  end

  def show
    @resumes = Resume.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "resume.pdf",
        template: "user/resumes/show.pdf.erb"
      end
    end
  end
  def download
    @resumes = Resume.all
    html = render_to_string(:action => :show)
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
      :filename => "resume.pdf",
      :disposition => 'attachment')
  end
  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(question_params)
    @resume.save
    redirect_to user_resumes_path
  end



  private
  # 50列参数
  def question_params
    params.require(:resume).permit(
      :answer00,:answer01,:answer02,:answer03,:answer04,:answer05,:answer06,:answer07,:answer08,:answer09,
      :answer10,:answer11,:answer12,:answer13,:answer14,:answer15,:answer16,:answer17,:answer18,:answer19,
      :answer20,:answer21,:answer22,:answer23,:answer24,:answer25,:answer26,:answer27,:answer28,:answer29,
      :answer30,:answer31,:answer32,:answer33,:answer34,:answer35,:answer36,:answer37,:answer38,:answer39,
      :answer40,:answer41,:answer42,:answer43,:answer44,:answer45,:answer46,:answer47,:answer48,:answer49,
      :answer50,:answer51,:answer52,:answer53,:answer54,:answer55,:answer56,:answer57,:answer58,:answer59)
  end

end
