# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "shadymtadros@hotmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', first_name: "shady", last_name: "tadros", location: "16 Villa Gaudelet, Paris")
User.create(email: "blabla@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret', first_name: "meh", last_name: "bla")
Booking.create(start_date: Date.new(2001, 2, 3), end_date: Date.new(2001, 2, 5), user_id: 1, puppy_id: 2)
Booking.create(start_date: Date.new(2001, 2, 3), end_date: Date.new(2001, 2, 5), user_id: 2, puppy_id: 1)
Review.create(title: "bla bla", rating: 5, booking_id: 1, reviewee: "user")
Review.create(title: "bla bla", rating: 5, booking_id: 2, reviewee: "puppy")



# 2.0 ADDING FAKER GENERATION / SEEDING HERE -JBM

require 'faker'

# 2.1 GENERATE USERS
10.times {

  # 2.1.2 GENERATE NAMES AND SET TO VARIABLES
  first = Faker::Name.unique.first_name
  last = Faker::Name.unique.last_name

  User.create(
    # 2.1.1 ALL PASSWORDS ARE 'password' FOR SEEDED USERS
    :password => 'password',
    :password_confirmation => 'password',


    # 2.1.3 SET NAMES TO NAMES
    first_name: first,
    last_name: last,

    # 2.1.4 SET EMAILS AS FIRST.LAST@RANDOM.COM
    email: Faker::Internet.email(name: "#{first} #{last}", separators: '.'),

    # 2.1.5 SET BIRTHDATES, USERS BETWEEN 18 AND 65
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),

    # 2.1.6 SET ADDRESS
    location: "#{rand(1..20)} Villa Gaudelet, Paris"
  )
}

15.times {
  new_pup = Puppy.new(
    name: Faker::Name.unique.first_name,
    birthdate: Faker::Date.birthday(min_age: 2, max_age: 10),
    breed: "Doggo",
    user_id: rand(1..25)
    )

  url = Faker::LoremFlickr.image(size: "220x220", search_terms: ['puppy'])
  new_pup.remote_photo_url = url
  new_pup.save
}


























