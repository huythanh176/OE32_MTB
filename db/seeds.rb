# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

start_at = "12-03-2020 16:30"
end_at = "12-03-2020 18:30"
movie_id = 2
room_id = 2

Schedule.create!(start_at: start_at, end_at: end_at,
                 movie_id: movie_id, room_id: room_id)
