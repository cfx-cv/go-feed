restaurants = Restaurant.create([
  {
    name: "Restoran Nasi",
    address: "Alamat Restoran Nasi",
    position: Position.create(latitude: -6.175110, longitude: 106.865036)
  }, {
    name: "Restoran Mie",
    address: "Alamat Restoran Mie",
    position: Position.create(latitude: -6.597147, longitude: 106.806038)
  }, {
    name: "Restoran Roti",
    address: "Alamat Restoran Roti",
    position: Position.create(latitude: -6.402484, longitude: 106.794243)
  }
])

restaurants.each do |restaurant|
  3.times do |i|
    Menu.create(
      name: restaurant.name.split[1] + " " + (65 + i).chr,
      price: i * 1000,
      restaurant: restaurant
    )
  end
end
