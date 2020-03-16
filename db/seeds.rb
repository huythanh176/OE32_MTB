# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

start_at = "19-03-2020 8:30"
end_at = "16-03-2020 18:30"
movie_id = 2
room_id = 1

Schedule.create!(start_at: start_at, end_at: end_at,
                 movie_id: movie_id, room_id: room_id)

start_at = "17-03-2020 10:30"
end_at = "16-03-2020 18:30"
movie_id = 2
room_id = 2

Schedule.create!(start_at: start_at, end_at: end_at,
                 movie_id: movie_id, room_id: room_id)

start_at = "16-03-2020 16:30"
end_at = "16-03-2020 18:30"
movie_id = 5
room_id = 3

Schedule.create!(start_at: start_at, end_at: end_at,
                 movie_id: movie_id, room_id: room_id)

start_at = "21-03-2020 18:30"
end_at = "16-03-2020 18:30"
movie_id = 1
room_id = 8

Schedule.create!(start_at: start_at, end_at: end_at,
                 movie_id: movie_id, room_id: room_id)

