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
# Craftperson.destroy_all
User.destroy_all

puts "Creating User Owner"
k_user = User.create!(
  name: "Kelly",
  email: "Kelly@outlook.com",
  address: "UPS Access Point, 11 Rue Jean Jaurès, 77100 Meaux, France"
  bio: "Blacksmith by trade and enjoy reparing furniture",
  password: "123456"
)
puts "User created"

puts "Creating User Owner"
r_user = User.create!(
  name: "Ricky",
  email: "Ricky@outlook.com",
  address: "23 Rue de Lutèce, 92160 Antony, France",
  bio: "I am a carpenter and love to build furniture",
  password: "123456"
)
puts "User created"

puts "Listing an item"

junk = Junk.new(

  address: "4 Rue Marcel Sembat, 93270 Sevran, France",
  description: "Got some old pine wood pieces with dimension are 2 X 5 X 10m",
  price: 0,
  user: k_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')



junk.save!
puts "junk #{junk.name} created"


junk = Junk.new(

  address: "9 Prom. des Mares, 93230 Romainville, France",
  description: "Got 4 old chairs",
  price:10,
  user: k_user)
  # file = URI.open('https://res.cloudinary.com/dfkgih0bp/image/upload/v1668158134/development/Experimental_Cocktail_Club_gzeegk.png')
  # junk.photos.attach(io: file, filename: 'experimental.jpg', content_type: 'image/jpg')


junk.save!
puts "junk #{junk.name} created"
