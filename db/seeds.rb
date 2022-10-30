# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Faker::Config.locale = 'fr'

City.destroy_all
Listing.destroy_all
Reservation.destroy_all
User.destroy_all


#Create 10 cities
10.times do |create_city|
  create_city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

cities = City.all

#Create 20 users
20.times do |create_user|
  create_user = User.create(email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, description: Faker::Lorem.paragraph(sentence_count: 47))
end

users = User.all



#Create 50 listings
50.times do |create_listing|
  create_listing = Listing.create(available_beds: rand(10), price: rand(20..1000), description: Faker::Lorem.paragraph(sentence_count: 47), has_wifi: [true, false].sample, welcome_message: Faker::Lorem.paragraph(sentence_count: 10), city: cities.sample, user: users.sample)
end

listings = Listing.all

#For each listing
##Create 5 reservations in the past
# reservation_count = 0

# while reservation_count < 5 do 
#   create_reservation = Reservation.create(start_date: Faker::Date.backward(days: 365), end_date: Faker::Date.backward(days: 365) , listing: listings.sample, guest: users.sample)
#   reservation_count += 1
# end

# ##Create 5 reservations in the future
# reservation_count = 0

# while reservation_count < 5 do 
#   listing = listings.sample
#   puts listing
#   create_reservation = Reservation.create(start_date: Faker::Date.forward(days: 365), end_date: Faker::Date.forward(days: 365) , listing: listing, guest: users.sample)
#   if create_reservation.guest != listing.user
#     reservation_count += 1
#   end
# end

# reservations = Reservation.all