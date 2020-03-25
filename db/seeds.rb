# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Theater.create!(name:"CGV", address: "123 Hung vuong")
Theater.create!(name:"Galaxy", address: "456 Hung vuong")
Theater.create!(name:"Lotte", address: "789 Hung vuong")

3.times do |n|
  3.times do |c|
    Room.create!(theater_id: n + 1)
  end
end

9.times do |n|
  40.times do |c|
    Seat.create!(room_id: n + 1)
  end
end

Payment.create!(payment_type: 0)
Payment.create!(payment_type: 1)

Promotion.create!(content: "ZA")

User.create(name:"admin",phone:"123123123",password:"zxczxc", email:"admin@admin.com", is_admin: true)

# start_at = "24-03-2020 20:30"
# end_at = "24-03-2020 18:30"
# movie_id = 2
# room_id = 1

# Schedule.create!(start_at: start_at, end_at: end_at,
#                  movie_id: movie_id, room_id: room_id)
