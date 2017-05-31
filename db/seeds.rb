# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Seeding database"

user_seed = [
  {
  first_name: "Tim",
  last_name: "Almamedov",
  email: "tim.almamedov@gmail.com",
  birthdate: Date.new(1993,10,19),
  password: "password",
  password_confirmation: "password",
  gender: 'Male',
  address: 'tims address',
  phone_number: '+43 660 479 42 52',
  about: "my info dlfgjh dljfsdjf sodijfsoid sdofjisiodf"
  },

  {
  first_name: "John",
  last_name: "Dawson",
  email: "john.dawson@gmail.com",
  birthdate: Date.new(1983,4,9),
  password: "secret",
  password_confirmation: "secret",
  gender: 'Male',
  address: "John's address",
  phone_number: '+32 490 630 94 11',
  about: "my info dlfgjh dljfsdjf sodijfsoid sdofjisiodf"
  },

  {
  first_name: "Nicolas",
  last_name: "Peltier",
  email: "nicolas.peltier@me.com",
  birthdate: Date.new(1983,4,9),
  password: "secret",
  password_confirmation: "secret",
  gender: 'Male',
  address: "11 bis rue V Hauy, 75015 Paris, France",
  phone_number: '+32 490 630 94 11',
  about: "my info dlfgjh dljfsdjf sodijfsoid sdofjisiodf"
  }
]

flat_seed = [
  {
  description: "Thats a long description",
  short_description: "A lovely home in Austria",
  user_id: 1,
  room_count: 5,
  property_type: "House",
  price: 100,
  country: "AT",
  city: "Vienna",
  street: "some street 25/3",
  zipcode: "1220"
  },

  {
  description: "Thats a long description",
  short_description: "Nice studio in Brussels",
  user_id: 2,
  room_count: 1,
  property_type: "Studio",
  price: 40,
  country: "BE",
  city: "Brussels",
  street: "some street 2",
  zipcode: "1008"
  },
    {
  description: "Thats a new long description",
  short_description: "Nice studio in the center of Uccle",
  user_id: 2,
  room_count: 1,
  property_type: "Studio",
  price: 40,
  country: "BE",
  city: "Brussels",
  street: "some street 2",
  zipcode: "1008"
  },
    {
  description: "Thats a long description",
  short_description: "Nice and calm studio in Paris",
  user_id: 3,
  room_count: 1,
  property_type: "Studio",
  price: 40,
  country: "FR",
  city: "Paris",
  street: "some street 2",
  zipcode: "1008"
  },
    {
  description: "Thats a long description",
  short_description: "Nice studio in Marseille",
  user_id: 3,
  room_count: 1,
  property_type: "Studio",
  price: 40,
  country: "FR",
  city: "Marseille",
  street: "some street 2",
  zipcode: "1008"
  }
]

User.create!(user_seed)
Flat.create!(flat_seed)

Booking.create!(
  start_date: Date.new(2017,6,20),
  end_date: Date.new(2017,7,29),
  status: "Pending",
  user_id: 1,
  flat_id: 2
  )

Booking.create!(
  start_date: Date.new(2017,7,20),
  end_date: Date.new(2017,8,29),
  status: "Pending",
  user_id: 1,
  flat_id: 3
  )

Booking.create!(
  start_date: Date.new(2017,9,20),
  end_date: Date.new(2017,10,29),
  status: "Pending",
  user_id: 2,
  flat_id: 3
  )

Review.create!(
  content: "A very nice apartment",
  rating: 4,
  user_id: 2,
  flat_id: 1
  )


puts "Seeding done"
