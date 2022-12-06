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
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France",
  bio: "Blacksmith by trade and enjoy repairing furniture",
  password: "123456"
)
puts "User created."

puts "Creating User Owner"
r_user = User.create!(
  username: "Ricky",
  email: "Ricky@outlook.com",
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France",
  bio: "I am a carpenter and love to build furniture",
  password: "123456"
)
puts "User created."

#creating junk content -----------------------------------------
puts "Listing a junk"

junk = Junk.new(
  title: "Some good wood panel to give away",
  address: "4 Rue Marcel Sembat, 93270 Sevran, France",
  description: "Got some old pine wood pieces with dimension: 2 X 5 X 10m",
  category:"Materials",
  price: 0,
  user: k_user)
  file = URI.open('https://images.unsplash.com/photo-1519668106955-a24e5f67f8c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8anVua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
  junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')
  file2 = URI.open('https://images.unsplash.com/photo-1519668106955-a24e5f67f8c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8anVua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
  junk.photos.attach(io: file2, filename: 'experimental.jpg', content_type: 'image/jpg')

junk.save!
puts "junk: #{junk.title} created."


junk = Junk.new(
  title: "4 old chairs good for upcycle projects",
  address: "9 Prom. des Mares, 93230 Romainville, France",
  description: "Got 4 old chairs to sell made from oak. Very traditional and from 1950s.",
  category: "Furniture",
  price:10,
  user: k_user)
  file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668940532/development/ValueJunk/internal%20img%20%28website%20itself%29/images/wooden-rocking-chair_hmbsz3.jpg')
  junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

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
  file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668940532/development/ValueJunk/internal%20img%20%28website%20itself%29/images/yarn-balls_caseiq.jpg')
  file2 = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668940532/development/ValueJunk/internal%20img%20%28website%20itself%29/images/yarn-balls_caseiq.jpg')
  file3 = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668940532/development/ValueJunk/internal%20img%20%28website%20itself%29/images/yarn-balls_caseiq.jpg')
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
  # delivery: false,
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

service.save!
puts "service: #{service.title} created."

service = Service.new(

  title: "Making window panel and frame",
  address: k_user.address,
  craft: "Ceramics and glass",
  description: "I have 5 years experience in window making involved renovating buildings and church windows. I am familar
  with traditional and modern techniques and will help you customise the window to fit your buidling design.",
  price:25,
  volunteer: false,
  user: r_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

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
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

service.save!
puts "service: #{service.title} created."

service = Service.new(

  title: "Custom furniture builder",
  address: t_user.address,
  craft: "Wood and furniture",
  description: "I have 10 years experience in repairing furniture and upcycle old ones. I also custom make furniture so that it fits your bespoke needs.",
  price:15,
  volunteer: false,
  user: k_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')

service.save!
puts "service: #{service.title} created."
