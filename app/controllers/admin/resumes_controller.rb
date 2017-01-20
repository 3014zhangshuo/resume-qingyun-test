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

  def edit_one_done
  end
end
