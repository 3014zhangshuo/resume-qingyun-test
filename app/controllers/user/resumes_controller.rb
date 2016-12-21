

class User::ResumesController < ApplicationController
  layout "pdf", only: [:download, :preview_download]

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
    # binding.pry
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
      :filename => "resume.pdf",
      :disposition => 'attachment')
  end

  def preview_download
    @resume = Resume.find(params[:resume_id])
    # html = render_to_string(params[:content])
    # pdf = WickedPdf.new.pdf_from_string(html)

    pdf = render_to_string pdf: "some_file_name", template: "user/resumes/show.pdf.erb", encoding: "UTF-8"

    send_data(pdf,
      :filename => "preview_resume.pdf",
      :disposition => 'attachment')
  end


  # 接受web发过来的编辑好的html数据，处理（如保存），之后redirect到显示这个html的pdf
  def relay
    @resume = Resume.find(params[:resume_id])    
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
    redirect_to user_resume_preview_path(@resume, format: :pdf)
  end


  def preview
    # render layout: "preview_layout", locals: { resume: Resume.find(params[:resume_id]) }
    @resume = Resume.find(params[:resume_id])
    # binding.pry
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "resume.pdf",
               template: "user/resumes/preview.pdf.erb",
               layout: "preview_layout.html.erb"
      end
    end
    # redirect_to user_resume_preview_path(@resume, format: :pdf)
  end


  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.save
    redirect_to user_resumes_path
  end



  # 拆分页面
  def page1
    @resume = Resume.new
  end

  def page1_commit
    @resume = Resume.new(resume_params)
    @resume.save
    # 重定向到下一页
    redirect_to page2_user_resume_path(@resume)
  end

  def page2
    @resume = Resume.find(params[:id])
  end

  def page2_commit
    @resume = Resume.find(params[:id])
    Resume.update(resume_params)
    redirect_to page3_user_resume_path(@resume.id)
  end

  def page3
    @resume = Resume.find(params[:id])
  end

  def page3_commit
    @resume = Resume.find(params[:id])
    Resume.update(resume_params)
    redirect_to page4_user_resume_path(@resume)
  end

  def page4
    @resume = Resume.find(params[:id])
  end

  def page4_commit
    @resume = Resume.find(params[:id])
    Resume.update(resume_params)
    redirect_to page5_user_resume_path(@resume)
  end

  def page5
    @resume = Resume.find(params[:id])
  end

  def page5_commit
    @resume = Resume.find(params[:id])
    Resume.update(resume_params)
    redirect_to user_resume_preview_path(@resume)
  end

  def finish
    @resume = Resume.find(params[:id])
  end


  private
  # 50列参数
  def resume_params
    params.require(:resume).permit(
      :answer00,:answer01,:answer02,:answer03,:answer04,:answer05,:answer06,:answer07,:answer08,:answer09,
      :answer10,:answer11,:answer12,:answer13,:answer14,:answer15,:answer16,:answer17,:answer18,:answer19,
      :answer20,:answer21,:answer22,:answer23,:answer24,:answer25,:answer26,:answer27,:answer28,:answer29,
      :answer30,:answer31,:answer32,:answer33,:answer34,:answer35,:answer36,:answer37,:answer38,:answer39,
      :answer40,:answer41,:answer42,:answer43,:answer44,:answer45,:answer46,:answer47,:answer48,:answer49,
      :answer50,:answer51,:answer52,:answer53,:answer54,:answer55,:answer56,:answer57,:answer58,:answer59)
  end

  def resume_html_for_resume(resume)
    if resume.resume_html.nil?
      resume.build_resume_html
    else
      resume.resume_html
    end
  end

end
