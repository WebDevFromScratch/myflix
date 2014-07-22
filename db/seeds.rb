# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "House", small_cover_url: "/tmp/house_sm.jpg", large_cover_url: "/tmp/house_lg.jpg", description: "An antisocial maverick doctor who specializes in diagnostic medicine does whatever it takes to solve puzzling cases that come his way using his crack team of doctors and his wits.", category_id: 2)
Video.create(title: "Entourage", small_cover_url: "/tmp/entourage_sm.jpg", large_cover_url: "/tmp/entourage_lg.jpg", description: "Film star Vince Chase navigates the vapid terrain of Los Angeles with a close circle of friends and his trusty agent.", category_id: 1)
Video.create(title: "Suits", small_cover_url: "/tmp/suits_sm.jpg", large_cover_url: "/tmp/suits_lg.jpg", description: "On the run from a drug deal gone bad, Mike Ross, a brilliant college-dropout, finds himself a job working with Harvey Specter, one of New York City's best lawyers.", category_id: 2)
Video.create(title: "The Wire", small_cover_url: "/tmp/wire_sm.jpg", large_cover_url: "/tmp/wire_lg.jpg", description: "Baltimore drug scene, seen through the eyes of drug dealers, and law enforcement.", category_id: 3)

Category.create(name: "Comedy")
Category.create(name: "Drama")
Category.create(name: "Crime")
