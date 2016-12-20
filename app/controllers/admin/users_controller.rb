class Admin::UsersController < ApplicationController
  before_action :require_is_admin
  before_action :authoritative!

  def index
    @users = User.all
  end
  
end
