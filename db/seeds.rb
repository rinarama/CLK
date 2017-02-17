require 'faker'
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tom = User.create({
      email: "tom@myspace.com",
      password: "123456",
      first_name: "Tom",
      last_name: "Anderson"
        })

10.times do
  User.create({
    email: Faker::Internet.free_email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    })

end
