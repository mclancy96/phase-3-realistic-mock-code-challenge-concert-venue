# Delete this file and the migrations folder after checking out the solution branch!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating venues..."
Venue.create(name: "Madison Square Garden", opening_year: 1968)
Venue.create(name: "Red Rocks Amphitheatre", opening_year: 1947)
Venue.create(name: "The Fillmore", opening_year: 1965)
Venue.create(name: "Royal Albert Hall", opening_year: 1871)

puts "Creating artists..."
Artist.create(name: "Taylor Swift")
Artist.create(name: "Ed Sheeran")
Artist.create(name: "Billie Eilish")
Artist.create(name: "The Weeknd")

puts "Creating performances..."
# TODO: create performances here
# Remember to create them with song_title, duration, artist_id, and venue_id
# For example:
# Performance.create(song_title: "Love Story", duration: 240, artist_id: taylor.id, venue_id: msg.id)

puts "Seeding done!"
