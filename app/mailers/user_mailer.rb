class UserMailer < ApplicationMailer

  def acknowledgement_user(name, email)
    @name = name
    mail(to: email, subject: "Acknowledgement Mail")
  end
end
