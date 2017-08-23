class ContactUsWorker
  include Sidekiq::Worker

  def perform(name, email)
    UserMailer.acknowledgement_user(name, email).deliver_now()
  end
end
