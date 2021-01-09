class ReconfirmedMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "I'm starting the fake job"
    sleep 3
    puts args
  end
end
