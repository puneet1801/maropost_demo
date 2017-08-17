class HomeController < ApplicationController
  before_action :authenticate_user!

  def contact_form
    redirect_to root_url, notice: "We will contact you soon."    
  end

end
