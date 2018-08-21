restaurants = Restaurant.create([
  {
    name: "Restoran Nasi",
    address: "Alamat Restoran Nasi",
    phone: "081234567890",
    description: "Sebuah Restoran Nasi",
    position: Position.create(latitude: -6.238140, longitude: 106.801513)
  }, {
    name: "Restoran Mie",
    address: "Alamat Restoran Mie",
    phone: "080987654321",
    description: "Sebuah Restoran Mie",
    position: Position.create(latitude: -6.237777, longitude: 106.797018)
  }, {
    name: "Restoran Roti",
    address: "Alamat Restoran Roti",
    phone: "081243568790",
    description: "Sebuah Restoran Roti",
    position: Position.create(latitude: -6.245222, longitude: 106.797242)
  }, {
    name: "Restoran Martabak",
    address: "Alamat Restoran Martabak",
    phone: "082134657809",
    description: "Sebuah Restoran Martabak",
    position: Position.create(latitude: -6.245381, longitude: 106.800330)
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

users = User.create([
  {
    username: "admin",
    email: "admin@admin.com",
    password: "adminpassword",
    password_confirmation: "adminpassword",
    role: "admin"
  },
  {
    username: "customer",
    email: "customer@customer.com",
    password: "customerpassword",
    password_confirmation: "customerpassword",
    role: "customer"
  },
  {
    username: "driver",
    email: "driver@driver.com",
    password: "driverpassword",
    password_confirmation: "driverpassword",
    role: "driver"
  },
])

restaurants.each do |restaurant|
  chosen_menu = restaurant.menus.sample
  OrderMenu.create(
    menu: chosen_menu,
    quantity: rand(1..5)
  )
end

orders = Order.create([
  {
    customer: users[1],
    driver: nil,
    order_destination: Position.create(latitude: -6.244298, longitude: 106.800604),
    restaurant: Restaurant.all[0],
    status: 0
  },
  {
    customer: users[1],
    driver: users[2],
    order_destination: Position.create(latitude: -6.244298, longitude: 106.800604),
    restaurant: Restaurant.all[1],
    status: 1
  },
  {
    customer: users[1],
    driver: users[2],
    order_destination: Position.create(latitude: -6.244298, longitude: 106.800604),
    restaurant: Restaurant.all[2],
    status: 2
  },
  {
    customer: users[1],
    driver: users[2],
    order_destination: Position.create(latitude: -6.244298, longitude: 106.800604),
    restaurant: Restaurant.all[0],
    status: 3
  },
])


order_menus = OrderMenu.create([
  {
    order: orders[0],
    menu: Restaurant.all[0].menus[rand(1..3)],
    quantity: 1
  },
  {
    order: orders[1],
    menu: Restaurant.all[1].menus[rand(1..3)],
    quantity: 2
  },
  {
    order: orders[2],
    menu: Restaurant.all[2].menus[rand(1..3)],
    quantity: 3
  },
  {
    order: orders[3],
    menu: Restaurant.all[3].menus[rand(1..3)],
    quantity: 4
  }
])
