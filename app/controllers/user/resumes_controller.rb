class User::ResumesController < ApplicationController
  # protect_from_forgery with: :null_session

  # skip_before_action :verify_authenticity_token  #open when skip csrf token verify

  layout "pdf", only: [:download, :preview_download]
  layout "preview_layout", only: :preview
  layout false, only: :save_html
  # layout 'preview_layout', only: :save_html



  def index
    @resumes = current_user.resumes.order(created_at: :DESC)
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

  def save_html
    @resume = Resume.find(params[:resume_id])
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
    # flash[:notice] = 'saved'
  end


  def preview

    @resume = Resume.find(params[:resume_id])
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

  # froala的upload image实现
  def upload_image

    @resume = Resume.find(params[:resume_id])
    @resume_image = @resume.resume_images.create
    @resume_image.content = params[:image_content]
    @resume_image.save

    # binding.pry
    
    respond_to do |format|
        format.json { render :json => { status: 'OK', link: @resume_image.content.url}}
    end
  end


# 点击new生成简历跳转page1
  def new
    @resume = Resume.new
    @resume.user = current_user
    @resume.save!
    redirect_to page1_user_resume_path(@resume)
  end

  # 拆分页面
  def page1
    @resume = Resume.find(params[:id])
    @resume.user = current_user
    @resume.save!
  end

  def page1_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)
    # 重定向到下一页
    redirect_to page2_user_resume_path(@resume)

  end

  def page2
    @resume = Resume.find(params[:id])
  end

  def page2_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)

    if params[:commit] == "保存并进入下一步"
      redirect_to page3_user_resume_path(@resume)
    elsif params[:commit] == "保存并修改上一步"
      redirect_to page1_user_resume_path(@resume)
    else
      redirect_to page2_user_resume_path(@resume)
    end
  end

  def page3
    @resume = Resume.find(params[:id])
  end

  def page3_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)

    if params[:commit] == "保存并进入下一步"
      redirect_to page4_user_resume_path(@resume)
    elsif params[:commit] == "保存并修改上一步"
      redirect_to page2_user_resume_path(@resume)
    else
      redirect_to page3_user_resume_path(@resume)
    end
  end

  def page4
    @resume = Resume.find(params[:id])
  end

  def page4_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)

    if params[:commit] == "保存并进入下一步"
      redirect_to page5_user_resume_path(@resume)
    elsif params[:commit] == "保存并修改上一步"
      redirect_to page3_user_resume_path(@resume)
    else
      redirect_to page4_user_resume_path(@resume)
    end
  end

	def page5
		@resume = Resume.find(params[:id])
	end

	def page5_commit
		@resume = Resume.find(params[:id])
		@resume.update(resume_params)

    if params[:commit] == "保存并进入下一步"
      redirect_to page6_user_resume_path(@resume)
    elsif params[:commit] == "保存并修改上一步"
      redirect_to page4_user_resume_path(@resume)
    else
      redirect_to page5_user_resume_path(@resume)
    end
	end

	def page6
    @resume = Resume.find(params[:id])
  end

  def page6_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)

    if params[:commit] == "保存并进入下一步"
      redirect_to page7_user_resume_path(@resume)
    elsif params[:commit] == "保存并修改上一步"
      redirect_to page5_user_resume_path(@resume)
    else
      redirect_to page6_user_resume_path(@resume)
    end
  end

  def page7
    @resume = Resume.find(params[:id])
  end

  def page7_commit
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)

    if params[:commit] == "生成简历"
      redirect_to user_resume_preview_path(@resume)
    else
      redirect_to page7_user_resume_path(@resume)
    end
  end

  def finish
    @resume = Resume.find(params[:id])
  end

  def standard_resume
  end





  private
  # 50列参数
  def resume_params
    params.require(:resume).permit(:name_resume,:one_line_description,:self_description,
		:past_description1,:past_description2,:why_employer,:why_employee1,:why_employee2,
		:why_employee3,:past_project_title1,:past_project_title2,:past_project_title3,
		:past_project_description1,:past_project_description2,:past_project_description3,
		:past_project_image1,:past_project_image2,:past_project_image3,:contact_details1,
		:contact_details2,:contact_details3,:contact_details4,:resume_name, :user_id)
  end

  def resume_html_for_resume(resume)
    if resume.resume_html.nil?
      resume.build_resume_html
    else
      resume.resume_html
    end

  end

end
