namespace :user do

  desc "send a reconfirm mail every 3 months"
  task check_reconfirm: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    checking_time_confirmed = Time.now - 3.months
    users.each do |user|
      user_have_to_reconfirm = !user.confirmed_at.nil? && checking_time_confirmed > user.confirmed_at
      if user_have_to_reconfirm
        new_token = SecureRandom.urlsafe_base64.to_s
        user.update!(confirmation_token: new_token, confirmed_at: nil, confirmation_sent_at: Time.now)
        user.send_confirmation_instructions
      end
    end
  end

  desc "check expired request"
  task check_expired: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    checking_time_expired = Time.now - 1.week
    users.each do |user|
      request_expired = user.request && user.request.statut == "confirmed" && user.confirmed_at.nil? && checking_time_expired > user.confirmation_sent_at
      if request_expired
        user.request.update!(statut: "expired")
      end
    end
  end

end
