# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "House", small_cover_url: "tmp/house_sm.jpg", large_cover_url: "tmp/house_lg.jpg")
Video.create(title: "Entourage", small_cover_url: "tmp/entourage_sm.jpg", large_cover_url: "tmp/entourage_lg.jpg")
Video.create(title: "Suits", small_cover_url: "tmp/suits_sm.jpg", large_cover_url: "tmp/suits_lg.jpg")
Video.create(title: "The Wire", small_cover_url: "tmp/wire_sm.jpg", large_cover_url: "tmp/wire_lg.jpg")
