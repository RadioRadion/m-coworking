Request.destroy_all
User.destroy_all

puts 'Creating users...'
user = User.new(email: "tony@gromail.com", password: "azertie", first_name: "Patrick", last_name: "Fiori", biography: "coucou la mif", phone_number: "0632469163")

# file = URI.open('https://tel.img.pmdstatic.net/fit/https.3A.2F.2Fprd2-tel-epg-img.2Es3-eu-west-1.2Eamazonaws.2Ecom.2FproviderPerson.2Fa4d2c5f0980e06f80.2Ejpeg/300x300/quality/80/patrick-fiori.jpeg')
# user.photo.attach(io: file, filename: 'fiori.jpg', content_type: 'image/jpg')
user.save!

puts 'Creating request...'
request = Request.create!(user: user, statut: "confirmed")
