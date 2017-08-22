class RegistrationsController < Devise::RegistrationsController

  def create
    random_password = (('a'..'z').to_a.shuffle[0,2]+(0..9).to_a.shuffle[0,7]+('A'..'Z').to_a.shuffle[0,1]).join
    params[:user][:password] = random_password
    params[:user][:password_confirmation] = random_password
    super
  end

end 