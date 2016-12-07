class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！你好！"
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "welcome.pdf"   # Excluding ".pdf" extension.
      end
    end
  end
end
