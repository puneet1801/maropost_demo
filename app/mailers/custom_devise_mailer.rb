class CustomDeviseMailer < Devise::Mailer

  default template_path: 'devise/mailer' 

  def confirmation_instructions(email, token, password)
    @password = password
    @token = token
    @email = email

    mail(to: @email, subject: "Confirmation instructions")
  end

  def reset_password_instructions(email, token, password)
    @password = password
    @token = token
    @email = email

    mail(to: @email, subject: "Reset Password Instructions")
  end
end 