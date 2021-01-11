class ContactMailer < ApplicationMailer

  def contact(user)
    mail(to: 'valentin.lassartesse@gmail.com', subject: "user.first_name")
  end

end
