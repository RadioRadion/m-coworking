Request.destroy_all
User.destroy_all


puts 'Creating users...'

#Ce user rempli les conditions nécessaires pour tester user:check_reconfirm en dev et en prod
user = User.new(email: "tony@gromail.com", password: "azertie", first_name: "Patrick",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user.confirm
user.save!
old_date = Time.now - 4.months
user.update!(confirmed_at: old_date)

#Ce user rempli les conditions nécessaires pour tester user:check_expired en dev et en prod
user2 = User.new(email: "vito@gromail.com", password: "azertie", first_name: "Garou",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user2.confirm
user.save!
old_date2 = Time.now - 2.weeks
user2.update!(confirmed_at: nil, confirmation_sent_at: old_date2)


user3 = User.create!(email: "mario@gromail.com", password: "azertie", first_name: "Jennifer",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user4 = User.create!(email: "luigi@gromail.com", password: "azertie", first_name: "Jean-Pascal",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user5 = User.create!(email: "panzani@gromail.com", password: "azertie", first_name: "Patrick",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
# file = URI.open('https://tel.img.pmdstatic.net/fit/https.3A.2F.2Fprd2-tel-epg-img.2Es3-eu-west-1.2Eamazonaws.2Ecom.2FproviderPerson.2Fa4d2c5f0980e06f80.2Ejpeg/300x300/quality/80/patrick-fiori.jpeg')
# user.photo.attach(io: file, filename: 'fiori.jpg', content_type: 'image/jpg')

puts 'Creating request...'

Request.create!(user: user, statut: "confirmed")
Request.create!(user: user2, statut: "confirmed")
Request.create!(user: user3, statut: "confirmed")
Request.create!(user: user4, statut: "expired")
Request.create!(user: user5, statut: "accepted")
