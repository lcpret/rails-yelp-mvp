# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts 'cleaning up database...'
Restaurant.destroy_all
puts 'database is clean!'


puts 'Creating restaurants'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian french japanese belgian].sample
  )
  puts "restaurant #{restaurant.id} was created."
  10.times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant_id: restaurant.id
    )
  end
  puts '10 reviews created!'
end
puts 'all done'
