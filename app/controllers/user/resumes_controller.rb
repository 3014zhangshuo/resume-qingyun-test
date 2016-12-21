class User::ResumesController < ApplicationController
  layout "pdf", only: [:download, :preview_download]
  # layout "preview_layout", only: [:preview]


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

  def preview_download
    @resume = Resume.find(params[:resume_id])
    html = render_to_string(:action => :preview)
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
      :filename => "preview_resume.pdf",
      :disposition => 'attachment')
  end

  def preview
    render layout: "preview_layout", locals: { resume: Resume.find(params[:resume_id]) }
    @resume = Resume.find(params[:resume_id])
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
		redirect_to page6_user_resume_path(@resume)
	end

	def page6
    @resume = Resume.find(params[:id])
  end

  def page6_commit
    @resume = Resume.find(params[:id])
    Resume.update(resume_params)
    redirect_to page7_user_resume_path(@resume)
  end

  def page7
    @resume = Resume.find(params[:id])
  end

  def page7_commit
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
    params.require(:resume).permit(:name_resume,:one_line_description,:self_description,
		:past_description1,:past_description2,:why_employer,:why_employee1,:why_employee2,
		:why_employee3,:past_project_title1,:past_project_title2,:past_project_title3,
		:past_project_description1,:past_project_description2,:past_project_description3,
		:past_project_image1,:past_project_image2,:past_project_image3,:contact_details1,
		:contact_details2,:contact_details3,:contact_details4)
  end

end
