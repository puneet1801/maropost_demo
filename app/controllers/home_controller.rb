class HomeController < ApplicationController
  before_action :authenticate_user!

  def contact_form
  	ContactUsWorker.perform_async(params[:name], params[:email])
    redirect_to root_url, notice: "We will contact you soon."
  end

end
