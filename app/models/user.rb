class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def send_devise_notification(notification, token, opts)
    DeviseConfirmWorker.perform_async(notification, self.email, token, self.password, opts)
  end
end
