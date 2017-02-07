class User::ResumesController < ApplicationController
  # protect_from_forgery with: :null_session

  # skip_before_action :verify_authenticity_token  #open when skip csrf token verify
  before_action :inspect_user_is_confrim #验证用户是否通过验证
  layout "pdf", only: [:download, :preview_download]
  layout "preview_layout", only: :preview
  layout false, only: :save_html
  # layout 'preview_layout', only: :save_html



  def index
    @resumes = current_user.resumes.recent
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

  def destroy
    @resume = Resume.destroy(params[:id])
    respond_to do |format|
       format.html { redirect_to user_resumes_path }
       format.js
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
    @resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    # html = render_to_string(params[:content])
    # pdf = WickedPdf.new.pdf_from_string(html)

    pdf = render_to_string pdf: "some_file_name", template: "user/resumes/show.pdf.erb", encoding: "UTF-8"

    send_data(pdf,
      :filename => "preview_resume.pdf",
      :disposition => 'attachment')
  end


  # 接受web发过来的编辑好的html数据，处理（如保存），之后redirect到显示这个html的pdf
  def relay

    @resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
    redirect_to user_resume_preview_path(@resume, format: :pdf)
  end

  def save_html
    @resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
  end


  def preview

    @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "resume.pdf",
               template: "user/resumes/preview.pdf.erb",
               layout: "preview_layout.html.erb"
               #wkhtmltopdf: 'bin/wkhtmltopdf-amd64'
               #:show_as_html => 'true'
      end
    end
    # redirect_to user_resume_preview_path(@resume, format: :pdf)
  end

	def editor
		@resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
		if @resume.aasm_state == "drafting"
			 @resume.user_order!
		end
	end

	def first_submit
		@resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
		if @resume.aasm_state == "ordered"
			@resume.user_start!
      #binding.pry
		end
		redirect_to user_resume_editor_path(@resume)
  	flash[:notice] = "提交成功！导师将于24小时以内给予反馈"
	end

	def second_submit
		@resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
    @user = current_user
		if @resume.aasm_state == "edit_one"
			@resume.user_second_start!
		end
    ResumeMailer.notify_master_sumbit_two(@user,@resume).deliver!
		redirect_to user_resume_editor_path(@resume)
  	flash[:notice] = "提交成功！导师将于24小时以内给予反馈"
	end

	def complete_resume
		@resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    @resume_html.save
		if @resume.aasm_state == "edit_two"
			@resume.user_mark_complete!
		end
		redirect_to user_resumes_path
  	flash[:notice] = "感谢您使用简历黑客！"
	end


  # froala的upload image实现
  def upload_image

    @resume = @resume = current_user.resumes.find_by_id(params[:resume_id]) or not_found
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
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
    @resume.user = current_user
    @resume.save!
  end

  def page1_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
    @resume.update(resume_params)
    # 重定向到下一页
    redirect_to page2_user_resume_path(@resume)

  end

  def page2
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
  end

  def page2_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
  end

  def page3_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
  end

  def page4_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
		@resume = current_user.resumes.find_by_id(params[:id]) or not_found
	end

	def page5_commit
		@resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
  end

  def page6_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
  end

  def page7_commit
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
    @resume.update(resume_params)

    if params[:commit] == "生成简历"
      # @resume.user_start!
      redirect_to user_resume_preview_path(@resume)
    else
      redirect_to page7_user_resume_path(@resume)
    end

  end

  def finish
    @resume = current_user.resumes.find_by_id(params[:id]) or not_found
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
