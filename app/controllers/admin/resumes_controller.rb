class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @user = User.find(params[:user_id])
    @resumes = @user.resumes
  end

  def show
    @user = User.find(params[:user_id])
    @resume = @user.resumes.find(params[:id])
  end

  def preview
    @user = User.find(params[:user_id])
    @resume = @user.resumes.find(params[:id])
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

  def save_html
    @user = User.find(params[:user_id])
    @resume = @user.resumes.find(params[:id])
    @resume_html = resume_html_for_resume(@resume)
    @resume_html.content = params[:content]
    if @resume.aasm_state == "submit_one"
      @resume.expert_first_start!
    elsif @resume.aasm_state == "edit_one"
      @resume.expert_first_done!
    elsif @resume.aasm_state == "submit_two"
      @resume.expert_second_start!
    elsif @resume.aasm_state == "edit_two"
      @resuem.expert_second_done!
    end
    @resume_html.save
    # flash[:notice] = 'saved'
  end
end
