class ContactMailer < ApplicationMailer

  def reconfirm(user)
    @user = user
    mail(to: user.email, subject: "Reconfirmez votre addresse mail")
  end

end
