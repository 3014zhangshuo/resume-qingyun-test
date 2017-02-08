class Admin::OrdersController < ApplicationController

  def index
    @orders = User.find(params[:id]).orders
  end

  def sent_code
  end

end
