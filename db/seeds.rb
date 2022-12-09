# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'


puts "Clearing Database"
Junk.destroy_all
Service.destroy_all
User.destroy_all

#create users -------------------------------------------------
puts "Creating User Owner"
k_user = User.create!(
  username: "Kelly",
  email: "Kelly@outlook.com",
  address: "23-1 Rue de la Marne, 94400 Vitry-sur-Seine, France",
  bio: "I am a fashion designer and experience in making fancy dress and costume",
  password: "123456"
  )
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1669482597/Kelly_n4hdii.jpg')
  k_user.photo.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
k_user.save!
puts "User created."

puts "Creating User Owner"
t_user = User.create!(
  username: "Taylor",
  email: "Taylor@outlook.com",
  address: "11 Rue Anatole France, 78530 Buc, France",
  bio: "Blacksmith by trade and enjoy repairing furniture",
  password: "123456"
)
file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670455368/ValueJunk/blacksmith_y7beuq.jpg')
t_user.photo.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
puts "User created."

puts "Creating User Owner"
r_user = User.create!(
  username: "Ricky",
  email: "Ricky@outlook.com",
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France",
  bio: "I am a carpenter and love to build furniture",
  password: "123456"
)
file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670455915/ValueJunk/carpenter2_mhnlc1.jpg')
r_user.photo.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
puts "User created."

#creating junk content -----------------------------------------
puts "Listing a junk"

junk = Junk.new(
  title: "Some 4x4 wood panels to give away",
  address: "4 Rue Marcel Sembat, 93270 Sevran, France",
  description: "Got some old pine wood pieces with dimension: 2 X 5 X 10m",
  category:"Materials",
  price: 0,
  user: k_user)
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456139/ValueJunk/Wood-planks001_c1swib.jpg')
  junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  file2 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670454973/ValueJunk/few-wood-planks002_z9zqzx.jpg')
  junk.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."


junk = Junk.new(
  title: "some old chairs good for upcycle projects",
  address: "9 Prom. des Mares, 93230 Romainville, France",
  description: "Got 4 old chairs to sell made from oak. Very traditional and from 1950s.",
  category: "Furniture",
  price:10,
  user: k_user)
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456218/ValueJunk/wood_chairs_w02gjp.webp')
  junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  file2 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456219/ValueJunk/wood_chairs_traditional_hr6pa7.jpg')
  junk.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."

puts "Listing a junk"

junk = Junk.new(
  title: "Some old curtains to give away",
  address: "16 Bd Verd de Saint-Julien, 92190 Meudon, France",
  description: "Got some red curtains to give away. Dimension is 10 X 50m.",
  category:"Décor",
  price: 0,
  user: k_user)
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670457984/ValueJunk/88b3f449b678382fdbc6afc96e05e7e6_bcrqdw.jpg')
  file2 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670457984/ValueJunk/a0b521589593203025c96c544c03d550_d5kfb0.jpg')
  file3 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670458327/ValueJunk/curtains_lf43hn.jpg')
  junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  junk.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')
  junk.photos.attach(io: file3, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."

junk = Junk.new(
  title: "A old classic coffee table",
  address: "35 Av. du Château, 92190 Meudon, France",
  description: "An old class coffee table made from pine wood.",
  category: "Furniture",
  price: 20,
  user: r_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."


junk = Junk.new(
  title: "A single bed for sale",
  address: "16 Rue du Poirier Oudet, 94520 Mandres-les-Roses, France",
  description: "A single bed frame made from pine wood. It has a spring base and dimension 190x90cm.",
  category: "Furniture",
  price: 50,
  donation: false,
  delivery: true,
  user: r_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."

#create services content-------------------------

service = Service.new(

  title: "Skilled smith in knifes and small jewleries",
  address: "23-1 Rue de la Marne, 94400 Vitry-sur-Seine, France",
  craft: "Metal",
  description: "I have 10 years experience in blacksmith and expert in making knifes and all sorts tools. I produced props for movie sets like Brave heart.",
  price:20,
  volunteer: false,
  user: r_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  service.speciality_list.add("Blacksmithing", "Casting","Jewellery", "Knife making" )
service.save!
puts "service: #{service.title} created."

service = Service.new(

  title: "Making window panel and frame",
  address: r_user.address,
  craft: "Ceramics and glass",
  description: "I have 5 years experience in window making involved renovating buildings and church windows. I am familar
  with traditional and modern techniques and will help you customise the window to fit your buidling design.",
  price:25,
  volunteer: false,
  user: r_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  service.speciality_list.add("Glass and glass art", "Woodworking","Wood carving" )

service.save!
puts "service: #{service.title} created."

service = Service.new(

  title: "Party outfit and costume designer",
  address: k_user.address,
  craft: "Fibre and textile",
  description: "I have experience in making party outfits and all sort of custome for parties.
   I am concious about the enviroment and aim to upcycle old clothing in my design. Please check out my portfolio.
   I also provide free consultations services to community projects and school arts.",
  price:15,
  volunteer: false,
  user: k_user)
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670454982/ValueJunk/VikKing_hkszmf.jpg')
  service.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  file2 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670454973/ValueJunk/Dark-Vador_i9gldp.jpg')
  service.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')
  file3 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456924/ValueJunk/il_340x270.4352777136_pvcz_clx1mt.webp')
  service.photos.attach(io: file3, filename: 'experimental.jpg', content_type: 'image/jpg')
  service.speciality_list.add("Stitch", "Fashion","Needlework","Sewing", "dyeing" )
service.save!
puts "service: #{service.title} created."

service = Service.new(

  title: "Custom furniture builder",
  address: t_user.address,
  craft: "Wood and furniture",
  description: "I have 10 years experience in repairing furniture and upcycle old ones. I also custom make furniture so that it fits your bespoke needs.",
  price:15,
  volunteer: false,
  user: t_user)
  file = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456803/ValueJunk/sideboar3_t91vi0.jpg')
  service.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  file2 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456803/ValueJunk/cabinet-color1_ieuvuy.jpg')
  service.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')
  file3 = URI.open('https://res.cloudinary.com/dvveiqb1p/image/upload/v1670456802/ValueJunk/Cabinet2_jx58ro.jpg')
  service.photos.attach(io: file3, filename: 'experimental.jpg', content_type: 'image/jpg')
  service.speciality_list.add("Cabinet making", "Carpentry","Wood burning","Woodworking")
service.save!
puts "service: #{service.title} created."




#create chatroom-------------------------
chatroom1=Chatroom.create!(name: "Kelly")
puts "chatroom #{chatroom1.name} created."

#create chatroom-------------------------
chatroom2=Chatroom.create!(name: "Ricky")
puts "chatroom #{chatroom2.name} created."

#create chatroom-------------------------
chatroom3=Chatroom.create!(name: "Taylor")
puts "chatroom #{chatroom3.name} created."
