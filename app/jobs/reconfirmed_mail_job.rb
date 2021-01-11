class ReconfirmedMailJob < ApplicationJob
  queue_as :default

  # ReconfirmedMailJob.set(wait: 1.minute).perform_later

  def perform(*args)
    puts "I'm starting the fake job"
    sleep 3
    # users.each do |user|
    #   user.send_confirmation_instructions
    # end
    ContactMailer.contact("ok").deliver_now
  end
end
