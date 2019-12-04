# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "shadymtadros@hotmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', first_name: "shady", last_name: "tadros")
Puppy.create(name: "luke skywalker", breed: "golden retriever", birthdate: Date.new(2001, 2, 3), user_id: 1)
User.create(email: "blabla@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', first_name: "meh", last_name: "bla")
Puppy.create(name: "other dog", breed: "golden retriever", birthdate: Date.new(2001, 2, 3), user_id: 2)
Booking.create(start_date: Date.new(2001, 2, 3), end_date: Date.new(2001, 2, 5), user_id: 1, puppy_id: 2)
Booking.create(start_date: Date.new(2001, 2, 3), end_date: Date.new(2001, 2, 5), user_id: 2, puppy_id: 1)
Review.create(title: "bla bla", rating: 5, booking_id: 1, reviewee: "user")
Review.create(title: "bla bla", rating: 5, booking_id: 2, reviewee: "booking")
