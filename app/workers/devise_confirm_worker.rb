class DeviseConfirmWorker
  include Sidekiq::Worker

  def perform(notification, email, token, password, opts={})
    CustomDeviseMailer.send(notification, email, token, password).deliver
  end
end
