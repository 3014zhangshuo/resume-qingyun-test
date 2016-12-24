class WelcomeController < ApplicationController
  layout "pdf", only: [:show, :download]
  def index
  
  end

  def show
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "welcome.pdf",
    #     template: "welcome/show.pdf.erb"
    #   end
    # end
  end

  def download
    html = render_to_string(:action => :show)
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
      :filename => "welcome.pdf",
      :disposition => 'attachment')
  end
end
