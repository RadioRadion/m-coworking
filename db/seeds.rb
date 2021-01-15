Request.destroy_all
User.destroy_all

puts 'Creating admin...'
admin = User.new(email: "carlita@gromail.com", password: "azertie", first_name: "Carlita",
  last_name: "Fiori", biography: "Voici ma vie, admin en plus", phone_number: "0632469163", admin: true)
admin.skip_confirmation!
admin.save!

puts 'Creating users...'

#Ce user rempli les conditions nécessaires pour tester user:check_reconfirm en dev et en prod
user = User.new(email: "tony@gromail.com", password: "azertie", first_name: "Tony",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user.confirm
user.skip_confirmation!
user.save!
old_date = Time.now - 4.months
user.update!(confirmed_at: old_date)

#Ce user rempli les conditions nécessaires pour tester user:check_expired en dev et en prod
user2 = User.new(email: "vito@gromail.com", password: "azertie", first_name: "Vito",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user2.confirm
user2.skip_confirmation!
user2.save!
old_date2 = Time.now - 2.weeks
user2.update!(confirmed_at: nil, confirmation_sent_at: old_date2)


user3 = User.new(email: "mario@gromail.com", password: "azertie", first_name: "Mario",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user3.skip_confirmation!
user3.save!
user4 = User.new(email: "luigi@gromail.com", password: "azertie", first_name: "Luigi",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user4.skip_confirmation!
user4.save!
user5 = User.new(email: "panzani@gromail.com", password: "azertie", first_name: "Panzani",
  last_name: "Fiori", biography: "Voici ma vie", phone_number: "0632469163")
user5.skip_confirmation!
user5.save!
# file = URI.open('https://tel.img.pmdstatic.net/fit/https.3A.2F.2Fprd2-tel-epg-img.2Es3-eu-west-1.2Eamazonaws.2Ecom.2FproviderPerson.2Fa4d2c5f0980e06f80.2Ejpeg/300x300/quality/80/patrick-fiori.jpeg')
# user.photo.attach(io: file, filename: 'fiori.jpg', content_type: 'image/jpg')

puts 'Creating request...'

Request.create!(statut: "confirmed",
        user: user, email: user.email,
        biography: user.biography,
        phone_number: user.phone_number,
        first_name: user.first_name,
        last_name: user.last_name)
Request.create!(statut: "confirmed",
        user: user2, email: user2.email,
        biography: user2.biography,
        phone_number: user2.phone_number,
        first_name: user2.first_name,
        last_name: user2.last_name)
Request.create!(statut: "confirmed",
        user: user3, email: user3.email,
        biography: user3.biography,
        phone_number: user3.phone_number,
        first_name: user3.first_name,
        last_name: user3.last_name)
Request.create!(statut: "expired",
        user: user4, email: user4.email,
        biography: user4.biography,
        phone_number: user4.phone_number,
        first_name: user4.first_name,
        last_name: user4.last_name)
Request.create!(statut: "accepted",
        user: user5, email: user5.email,
        biography: user5.biography,
        phone_number: user5.phone_number,
        first_name: user5.first_name,
        last_name: user5.last_name)
