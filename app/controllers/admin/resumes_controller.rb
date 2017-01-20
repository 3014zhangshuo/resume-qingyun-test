class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @user = User.find(params[:user_id])
    @resumes = @user.resumes
  end

  def show
    @resume = Resume.find(params[:id])
  end
end
