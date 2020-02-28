# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = "cau be ma 2"
description = Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add:            4)
time = 110
picture = "https://www.cgv.vn/media/catalog/product/cache/1/small_image/240x388/dd828b13b1cb77667d034d5f59a82eb6/t/e/teaser_poster_web_1__1.jpg"
Movie.create!(name:  name,
              description: description,
              time: time,
              picture: picture)
