class UserMailer < ApplicationMailer

  def acknowledgement_user(data)
    @data = data
    mail(to: @data[:email], subject: "Acknowledgement Mail")
  end
end
