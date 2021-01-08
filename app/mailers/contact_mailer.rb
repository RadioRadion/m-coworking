class ContactMailer < ApplicationMailer

  def contact
    mail(to: 'valentin.lassartesse@gmail.com', subject: 'sujet test')
  end
end
