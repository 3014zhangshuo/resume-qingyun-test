class User::ResumesController < ApplicationController
  layout "pdf", only: [:download, :preview_download]

  def index
    @resumes = Resume.all.order(created_at: :DESC)
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
<<<<<<< HEAD
    @resume.save
=======
    @resume.user = current_user
		@resume.save!
>>>>>>> f29594ce53bfd89231a55f4f47a68d4e711b3912
    # 重定向到下一页
    redirect_to page2_user_resume_path(@resume)
  end

  def page2
    @resume = Resume.find(params[:id])
  end

  def page2_commit
    @resume = Resume.find(params[:id])
<<<<<<< HEAD
    Resume.update(resume_params)
    redirect_to page3_user_resume_path(@resume.id)
=======
    @resume.update(resume_params)
    redirect_to page3_user_resume_path(@resume)
>>>>>>> f29594ce53bfd89231a55f4f47a68d4e711b3912
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
		@resume.update(resume_params)
		redirect_to page6_user_resume_path(@resume)
	end

	def page6
    @resume = Resume.find(params[:id])
  end

  def page6_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)
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
<<<<<<< HEAD
		:contact_details2,:contact_details3,:contact_details4)
=======
		:contact_details2,:contact_details3,:contact_details4,:resume_name, :user_id)
  end

  def resume_html_for_resume(resume)
    if resume.resume_html.nil?
      resume.build_resume_html
    else
      resume.resume_html
    end
>>>>>>> f29594ce53bfd89231a55f4f47a68d4e711b3912
  end

end
