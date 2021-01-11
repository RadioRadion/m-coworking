class ReconfirmedMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "I'm starting the fake job"
    sleep 3
    users = User.User.where("created_at < ?", Time.now)
    p users
    users.each do |user|
      user.send_confirmation_instructions
    end
    # ContactMailer.contact("ok").deliver_now
  end
end
