class HomeController < ApplicationController
  before_action :authenticate_user!

  def contact_form
    UserMailer.acknowledgement_user(params).deliver_now()
    redirect_to root_url, notice: "We will contact you soon."
  end

end
