# frozen_string_literal: true

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
User.destroy_all
Listing.destroy_all
Reservation.destroy_all

# Create 10 cities
10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# Create 20 users
20.times do
  User.create(
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.paragraph(sentence_count: 47)
  )
end

# Create 50 listings
50.times do
  Listing.create(
    available_beds: rand(10),
    price: rand(20..1000),
    description: Faker::Lorem.paragraph(sentence_count: 47),
    has_wifi: [true, false].sample,
    welcome_message: Faker::Lorem.paragraph(sentence_count: 10),
    city: City.all.sample,
    user: User.all.sample
  )
end

# For each listing
## Create 5 reservations in the past
reservation_count = 0

while reservation_count < 5
  create_reservation =
    Reservation.create(
      start_date: Faker::Date.backward(days: 365),
      end_date: Faker::Date.backward(days: 365),
      listing: Listing.all.sample,
      guest: User.all.sample
    )
  reservation_count += 1 if Reservation.all.include?(create_reservation)
end

## Create 5 reservations in the future
reservation_count = 0

while reservation_count < 5
  create_reservation =
    Reservation.create(
      start_date: Faker::Date.forward(days: 365),
      end_date: Faker::Date.forward(days: 365),
      listing: Listing.all.sample,
      guest: User.all.sample
    )
  reservation_count += 1 if Reservation.all.include?(create_reservation)
end
