# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = Restaurant.create([
  {
    name: "Restoran Nasi",
    address: "Alamat Restoran Nasi"
  }, {
    name: "Restoran Mie",
    address: "Alamat Restoran Mie"
  }, {
    name: "Restoran Roti",
    address: "Alamat Restoran Roti"
  }
])

restaurants.each do |restaurant|
  3.times do |i|
    Menu.create(
      name: restaurant.name.split[1] + " " + (65 + i).chr,
      price: i*1000,
      restaurant: restaurant
    )
  end
end
